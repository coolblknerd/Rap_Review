require 'rails_helper'

feature 'Update album' do

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

  scenario 'admin can update an album' do
    sign_in admin
    create_artist
    create_album
    expect(page).to have_content('King of Memphis')
    click_on 'Edit Album'
    fill_in('Label', with: 'Paper Route Empire')
    click_on 'Update'
    expect(page).to have_content('Paper Route Empire')
  end

  scenario 'denies update to admin with invalid attributes' do
    sign_in admin
    create_artist
    create_album
    expect(page).to have_content('King of Memphis')
    click_on 'Edit Album'
    fill_in('Title', with: '')
    click_on 'Update'
    expect(page).to have_content("Title can't be blank")
  end
end
