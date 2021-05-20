require 'rails_helper'

describe 'root' do
  it "displays welcome message and describes application" do
    visit '/'
    expect(page).to have_content("Welcome to Viewing Party!")
    expect(page).to have_content("Create an account and add friends to view your favorite movies!")
  end

  describe 'user creation' do
    it "creates new user" do
     visit '/'
     click_on "Sign Up to Be a User"
     expect(current_path).to eq(registration_path)
     email    = "mike@example.com"
     password = "ilovekfc"
     fill_in :email, with: email
     fill_in :password, with: password
     fill_in :password_confirmation, with: password
     click_on "Register"
     expect(current_path).to eq(dashboard_path)

     expect(page).to have_content("Welcome, #{email}!")
     new_user = User.last
     expect(new_user.email).to eq(email)
    end

    it "submits account creation with non-matching passwords" do
      visit '/'
      click_on "Sign Up to Be a User"
      expect(current_path).to eq(registration_path)
      email    = "mike@example.com"
      password = "ilovekfc"
      fill_in :email, with: email
      fill_in :password, with: password
      fill_in :password_confirmation, with: 'ilovebananas'
      click_on "Register"
      expect(current_path).to eq(registration_path)

      expect(page).to have_content("Mismatched passwords! Please try again.")
    end

    it "submits account creation with missing field(s)" do
      visit '/'
      click_on "Sign Up to Be a User"
      expect(current_path).to eq(registration_path)
      email    = "mike@example.com"
      password = "ilovekfc"
      fill_in :email, with: ''
      fill_in :password, with: password
      fill_in :password_confirmation, with: 'ilovekfc'
      click_on "Register"
      expect(current_path).to eq(registration_path)

      expect(page).to have_content("Please fill in all fields.")
    end

    it "attempts account creation with an already existing email" do
      existing_user = User.create!(email: 'theman27@aol.com', password: 'ilovechicken12')

      visit registration_path

      fill_in :email, with: existing_user.email
      fill_in :password, with: 'ohya23'
      fill_in :password_confirmation, with: 'ohya23'
      click_on "Register"
      expect(current_path).to eq(login_path)

      expect(page).to have_content("Account already exists! Please sign in.")
    end

    it "verifies email is downcased when submitted" do
      visit '/'
      click_on "Sign Up to Be a User"
      expect(current_path).to eq(registration_path)
      email    = "MIKE@EXAMPLE.com"
      password = "ilovekfc"
      fill_in :email, with: email
      fill_in :password, with: password
      fill_in :password_confirmation, with: password
      click_on "Register"

      new_user = User.last

      expect(new_user.email).to eq('mike@example.com')
    end
  end
end
