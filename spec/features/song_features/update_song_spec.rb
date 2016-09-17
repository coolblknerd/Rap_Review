require 'rails_helper'

feature 'update song' do

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

  def create_album
    visit artists_path
    click_on 'Create Album'
    fill_in('Title', with: 'King of Memphis')
    click_on 'Add Album'
  end

  def visit_album
    visit artists_path
    click_on 'More Albums'
    click_on 'King of Memphis'
  end

  def create_song
    click_on 'Create Song'
    fill_in('Title', with: 'Royalty')
    check('Features')
    fill_in('Writers', with: 'Young Dolph')
    click_on 'Add Song'
  end

  let(:admin) { FactoryGirl.create(:user, :admin) }
  let(:member) { FactoryGirl.create(:user, :member) }

  scenario 'admin can update a song' do
    sign_in admin
    create_artist
    create_album
    visit_album
    create_song
    visit_album
    click_on 'Update'
    fill_in('Title', with: 'Royalty (Remix)')
    click_on 'Save'
    expect(page).to have_content('Royalty (Remix)')
  end

end
