require 'rails_helper'

feature 'destroy artist' do

  def sign_in(user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log in'
  end

  let(:admin) { FactoryGirl.create(:user, :admin) }
  let(:member) { FactoryGirl.create(:user, :member) }

  scenario 'admin can delete artist' do
    sign_in admin
    visit artists_path
    click_on 'Create Artist'
    fill_in('Name', with: 'Travis Scott')
    fill_in('Bio', with: 'Amazing producer')
    fill_in('Origin', with: 'Houston, TX')
    click_on('Add Artist')
    artist = Artist.last
    visit artists_path
    click_on 'Delete'
    expect(page).to_not have_content artist.name
  end

end
