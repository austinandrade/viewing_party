require 'rails_helper'

describe 'user login' do
  before :each do
    @movie_1 = Movie.create(title: "King Kong")
    @movie_2 = Movie.create(title: "Castaway")

    @user_1 = User.create!(email: 'bobo@gmail.com', password: 'smokeweedeveryday')
    @user_2 = User.create!(email: 'bobo1@gmail.com', password: 'smokeweedeveryday')
    @user_3 = User.create!(email: 'bobo2@gmail.com', password: 'smokeweedeveryday')
    @user_4 = User.create!(email: 'bobo3@gmail.com', password: 'smokeweedeveryday')

    @friendship_1 = Friendship.create(follower_id: @user_1.id, followee_id: @user_2.id)
    @friendship_2 = Friendship.create(follower_id: @user_3.id, followee_id: @user_2.id)
    @friendship_3 = Friendship.create(follower_id: @user_4.id, followee_id: @user_2.id)

    @party_1 = Party.create(user_id: @user_2.id, movie_id: @movie_1.id, duration: 120, date: '9999-12-31', start_time: "13:00:00")

    @viewing_party_guests_1 = ViewingPartyGuest.create(user_id: @user_1.id, party_id: @party_1.id)
    @viewing_party_guests_2 = ViewingPartyGuest.create(user_id: @user_3.id, party_id: @party_1.id)
    @viewing_party_guests_3 = ViewingPartyGuest.create(user_id: @user_4.id, party_id: @party_1.id)

    @party_2 = Party.create(user_id: @user_1.id, movie_id: @movie_2.id, duration: 120, date: '9999-12-31', start_time: "15:00:00")
    @viewing_party_guests_4 = ViewingPartyGuest.create(user_id: @user_2.id, party_id: @party_2.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user_2)
    visit dashboard_path
  end

  describe 'user dashboard' do
    it 'user can see welcome message on dashboard' do
      expect(page).to have_content("Welcome #{@user_2.email}!")
    end

    it 'user can click button to discover movies' do
      click_button("Discover Movies")
      expect(current_path).to eq(movies_path)
    end

    it 'user can see a friends section' do
      expect(page).to have_content('Friends:')

      within("#following-#{@user_2.id}") do
        expect(page).to have_content('You currently have no friends')
        expect(page).to_not have_content(@user_1.email)
      end
    end

    it 'user can see viewing parties thay are hosting and are invited to' do
      within("#viewing_parties") do
        expect(page).to have_content('Viewing Parties')
      end

      within("#hosting-#{@party_1.id}") do
        expect(page).to have_content('Hosting')
        expect(page).to have_content(@movie_1.title)
        expect(page).to have_content(@party_1.date)
        expect(page).to have_content("at 01:00PM")
        expect(page).to have_content("#{@party_1.duration} minutes")
      end

      within("#invited_to-#{@party_2.id}") do
        expect(page).to have_content('Invited')
        expect(page).to have_content(@movie_2.title)
        expect(page).to have_content(@party_2.date)
        expect(page).to have_content("at 03:00PM")
        expect(page).to have_content("#{@party_2.duration} minutes")
      end
    end
  end
end
