require 'rails_helper'

feature 'User index page', :devise do

  scenario 'shows the list of user email address' do
    user = FactoryGirl.create(:user, :admin)
    login_as(user, scope: :user)
    visit users_path
    expect(page).to have_content user.email
  end

  scenario 'does not show user email address to member' do

  end
end
