require 'rails_helper'

describe 'user login' do
  before :each do
    @movie_1 = Movie.create(title: "King Kong")
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
      expect(page).to have_content("#{@user_2.email} friendships:")
      
      expect(page).to have_content(@user_1.email)
      expect(page).to have_content(@user_3.email)
      expect(page).to have_content(@user_4.email)
    end 
    
    it 'user can see viewing party guest groups' do
      expect(page).to have_content("#{@user_2.email} Movie Viewing Parties:")
      expect(page).to have_content("#{@viewing_party_guests_1.id}")
      expect(page).to have_content("#{@viewing_party_guests_2.id}")
      expect(page).to have_content("#{@viewing_party_guests_3.id}")
      # diplays per v.party: movie.name, date, start_time, hosted by user or invited to the V.P
    end
  end
end