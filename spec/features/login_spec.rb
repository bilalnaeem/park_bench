require 'rails_helper'

describe 'the signin process', :type => :feature do
  before :each do
    create(:user, email: 'valid@example.com')
  end

  it 'signs me in with correct email and password' do
    login_with 'valid@example.com', '12345678'
    expect(page).to have_content 'Logout'
  end

  it 'does not signs me in with incorrect email' do
    login_with 'incorrect@example.com', '12345678'
    expect(page).not_to have_content 'Logout'
  end

  it 'does not signs me in with incorrect password' do
    login_with 'valid@example.com', '12345'
    expect(page).not_to have_content 'Logout'
  end

  def login_with(email, password)
    visit new_user_session_path
    fill_in 'Email', :with => email
    fill_in 'Password', :with => password
    click_button 'Log in'
  end

end