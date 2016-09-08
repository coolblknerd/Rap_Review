require 'rails_helper'

feature 'creates albums' do

  def sign_in(user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log in'
  end

  def create_artist
    visit artists_path
    click_on('Create Artist')
    fill_in('Name', with: 'Young Dolph')
    fill_in('Bio', with: Faker::Lorem.sentence )
    fill_in('Origin', with: 'Memphis, TN')
    click_on('Add Artist')
  end

  let(:admin) { FactoryGirl.create(:user, :admin) }
  let(:member) { FactoryGirl.create(:user, :member) }

  scenario "artist is on index page" do
    sign_in admin
    create_artist
    expect(page).to have_content('Young Dolph')
  end

  scenario "admin can create a album" do
    sign_in admin
    create_artist
    visit artists_path
    click_on 'Create Album'
    fill_in('Title', with: 'King of Memphis')
    click_on 'Add Album'
    expect(page).to have_content('King of Memphis')
  end

  scenario "member can't create a album" do
    sign_in member
    create_artist
    visit artists_path
    click_on 'Create Album'
    fill_in('Title', with: 'King of Memphis')
    click_on 'Add Album'
    expect(page).to have_content('Access Denied')
  end

  scenario "added album is listed under artist on AIP (Artist Index Page)" do
    sign_in admin
    create_artist
    visit artists_path
    click_on 'Create Album'
    fill_in('Title', with: 'King of Memphis')
    click_on 'Add Album'
    visit artists_path
    expect(page).to have_content('King of Memphis')
  end

end
