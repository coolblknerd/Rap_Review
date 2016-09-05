require 'rails_helper'

feature 'create artist' do

  def sign_in(user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log in'
  end

  let(:user) { FactoryGirl.create(:user, :admin) }
  let(:member) { FactoryGirl.create(:user, :member) }

  scenario "admin can add a new artist" do
    sign_in(user)
    visit artists_path
    click_on('Create Artist')
    fill_in('Name', with: 'Young Dolph')
    fill_in('Bio', with: Faker::Lorem.sentence )
    fill_in('Origin', with: 'Memphis, TN')
    click_on('Add Artist')
    artist = Artist.last
    expect(current_path).to eq(artist_path(artist))
  end

  scenario "member can't add a new artist" do
    sign_in(member)
    visit artists_path
    click_on('Create Artist')
    fill_in('Name', with: 'Young Dolph')
    fill_in('Bio', with: Faker::Lorem.sentence )
    fill_in('Origin', with: 'Memphis, TN')
    click_on('Add Artist')
    artist = Artist.last
    expect(page).to have_content('Access Denied')
  end

end
