require 'rails_helper'

feature 'Sign In', :devise do

  def sign_in(user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log in'
  end

  let(:user) { User.create(email: 'test@example.com', password: 'password')}

  scenario 'user should be taken to root path' do
    sign_in(user)
    visit root_path
    current_path.should eq(root_path)
  end

  scenario 'user can not sign in without valid email' do
    sign_in(User.create(email: nil, password: 'password'))
    page.should have_content 'Invalid Email or password'
  end

  scenario 'user cannot sign in if not registered' do
    sign_in(User.new(email: 'me@email.com', password: 'password'))
    page.should have_content 'Invalid Email or password'
  end

  scenario 'user cannot sign in because of invalid password' do
    sign_in(User.create(email: 'me@email.com', password: nil))
    page.should have_content 'Invalid Email or password'
  end
end
