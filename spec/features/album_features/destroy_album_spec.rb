require 'rails_helper'

feature 'Destroy album' do

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

  let(:admin) { FactoryGirl.create(:user, :admin) }
  let(:member) { FactoryGirl.create(:user, :member) }

  scenario 'admin can remove an album' do
    sign_in admin
    create_artist
    create_album
    album = Album.last
    visit artists_path
    click_on 'More Albums'
    expect{ click_on 'Delete' }.to change(Album, :count).by(-1)
  end

end
