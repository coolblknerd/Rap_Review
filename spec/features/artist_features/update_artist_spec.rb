require 'rails_helper'

feature 'update artist' do

    def sign_in(user)
      visit new_user_session_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_on 'Log in'
    end

    let(:user) { FactoryGirl.create(:user, :admin) }
    let(:member) { FactoryGirl.create(:user, :member) }
    let(:artist) { FactoryGirl.create(:artist) }

    scenario "admin can update a artist profile" do
      sign_in(user)
      visit artists_path
      click_on('Create Artist')
      fill_in('Name', with: 'Young Dolph')
      fill_in('Bio', with: Faker::Lorem.sentence )
      fill_in('Origin', with: 'Memphis, TN')
      click_on('Add Artist')
      artist = Artist.last
      visit artists_path
      click_on 'Edit Artist'
      fill_in('Origin', with: 'Dallas, TX')
      click_on('Add Artist')
      expect(page).to have_content('Dallas, TX')
    end

    scenario "member can not update a artist profile" do
      sign_in(user)
      visit artists_path
      click_on('Create Artist')
      fill_in('Name', with: 'Young Dolph')
      fill_in('Bio', with: Faker::Lorem.sentence )
      fill_in('Origin', with: 'Memphis, TN')
      click_on('Add Artist')
      artist = Artist.last
      click_on('Sign Out')
      sign_in member
      visit artists_path
      click_on 'Edit Artist'
      fill_in('Name', with: "Poop")
      click_on('Add Artist')
      expect(page).to have_content('Access Denied')
    end

end
