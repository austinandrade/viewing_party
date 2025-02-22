require 'rails_helper'

describe 'user login' do
  before :each do
    @user = User.create!(email: 'bobo@gmail.com', password: 'smokeweedeveryday')
  end

  it "displays a button to login and redirects to login page" do
    visit '/'

    click_button 'I already have an account'

    expect(current_path).to eq(login_path)
  end

  it "fills out login form, clicks submit, and redirects to index page " do
    visit login_path

    fill_in :email, with: @user.email
    fill_in :password, with: @user.password

    click_button('Log In')
    expect(current_path).to eq(dashboard_path)

    expect(page).to have_content("Welcome Back #{@user.email}!")
  end

  it "fills out login form with invalid credentials and redirects to index page" do
    visit login_path

    fill_in :email, with: 'whatthefluff@msn.com'
    fill_in :password, with: 'genericpassword123'

    click_button('Log In')
    expect(current_path).to eq(login_path)

    expect(page).to_not have_button("Logout")
    expect(page).to have_button("Log In")

    expect(page).to have_content("Invalid credentials! Please try again.")
  end

  describe 'user logout' do
    it "logs out and displays logout message" do
      visit login_path

      fill_in :email, with: @user.email
      fill_in :password, with: @user.password
      click_button('Log In')

      visit '/'
      click_button('Logout')

      expect(page).to have_content("Successfully logged out.")
    end
  end

  it "attempts to visit dashboard when not authenticated" do
    visit dashboard_path

    expect(current_path).to eq('/')

    expect(page).to have_content("Access Denied! Please Register or Login")
  end
end
