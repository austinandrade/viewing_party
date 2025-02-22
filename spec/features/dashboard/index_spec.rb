require 'rails_helper'

describe 'user login' do
  before :each do
    @movie_by_id = File.read('spec/fixtures/movie_by_id.json')
    @movie_by_review = File.read('spec/fixtures/parasite_movie_reviews.json')
    @movie_by_credits = File.read('spec/fixtures/parasite_movie_cast.json')

      stub_request(:get, "https://api.themoviedb.org/3/movie/?api_key=#{ENV['TMD_api_key']}").
       with(
         headers: {
     	  'Accept'=>'*/*',
     	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
     	  'User-Agent'=>'Faraday v1.4.1'
         }).
       to_return(status: 200, body: @movie_by_id, headers: {})

      stub_request(:get, "https://api.themoviedb.org/3/movie//reviews?api_key=#{ENV['TMD_api_key']}").
        with(
          headers: {
         'Accept'=>'*/*',
         'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
         'User-Agent'=>'Faraday v1.4.1'
          }).
        to_return(status: 200, body: @movie_by_review, headers: {})

      stub_request(:get, "https://api.themoviedb.org/3/movie//credits?api_key=#{ENV['TMD_api_key']}").
       with(
         headers: {
     	  'Accept'=>'*/*',
     	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
     	  'User-Agent'=>'Faraday v1.4.1'
         }).
       to_return(status: 200, body: @movie_by_credits, headers: {})

    @user_1 = User.create!(email: 'bobo@gmail.com', password: 'smokeweedeveryday')
    @user_2 = User.create!(email: 'bobo1@gmail.com', password: 'smokeweedeveryday')
    @user_3 = User.create!(email: 'bobo2@gmail.com', password: 'smokeweedeveryday')
    @user_4 = User.create!(email: 'bobo3@gmail.com', password: 'smokeweedeveryday')

    @friendship_1 = Friendship.create(follower_id: @user_1.id, followee_id: @user_2.id)
    @friendship_2 = Friendship.create(follower_id: @user_3.id, followee_id: @user_2.id)
    @friendship_3 = Friendship.create(follower_id: @user_4.id, followee_id: @user_2.id)

    @party_1 = Party.create(user_id: @user_2.id, movie_title: "Pink", duration: 120, date: '9999-12-31', start_time: "13:00:00")

    @viewing_party_guests_1 = ViewingPartyGuest.create(user_id: @user_1.id, party_id: @party_1.id)
    @viewing_party_guests_2 = ViewingPartyGuest.create(user_id: @user_3.id, party_id: @party_1.id)
    @viewing_party_guests_3 = ViewingPartyGuest.create(user_id: @user_4.id, party_id: @party_1.id)

    @party_2 = Party.create(user_id: @user_1.id, movie_title: "Parasite", duration: 120, date: '2011-10-25', start_time: "15:00:00")
    @viewing_party_guests_4 = ViewingPartyGuest.create(user_id: @user_2.id, party_id: @party_2.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user_2)
    visit dashboard_path
  end

  describe 'logged in user dashboard' do
    it 'displays welcome message' do
      expect(page).to have_content("Welcome #{@user_2.email}!")
    end

    it 'displays discover movies button and redirects to discover page on click' do
      click_button("Discover Movies")
      expect(current_path).to eq(discover_path)
    end

    describe 'friend section' do
      it 'successfully adds a friend by their email ' do
        expect(page).to have_content('Friends')

        within("#following-#{@user_2.id}") do
          expect(page).to have_content('You currently have no friends.')

          fill_in :search, with: @user_1.email
          click_button 'Add Friend'

          expect(page).to have_content(@user_1.email)
        end

        expect(page).to have_content("Successfully added #{@user_1.email}!")
      end

      it "attempts to add invalid friend's email" do
        expect(page).to have_content('Friends')
        wanted_friend = 'yogabagaba@gmail.com'

        within("#following-#{@user_2.id}") do
          expect(page).to have_content('You currently have no friends.')

          fill_in :search, with: wanted_friend
          click_button 'Add Friend'

          expect(page).to have_content('You currently have no friends.')
        end

        expect(page).to have_content("#{wanted_friend} not found. Please try again!")
      end

      it "attempts to add already added friend" do
        expect(page).to have_content('Friends')

        within("#following-#{@user_2.id}") do
          expect(page).to have_content('You currently have no friends.')

          fill_in :search, with: @user_1.email
          click_button 'Add Friend'

          fill_in :search, with: @user_1.email
          click_button 'Add Friend'
        end
        expect(page).to have_content("#{@user_1.email} already added!")
      end

      it "attempts to add self" do
        expect(page).to have_content('Friends')

        within("#following-#{@user_2.id}") do
          fill_in :search, with: @user_2.email
          click_button 'Add Friend'
        end
        expect(page).to have_content("You cheeky buggar. You can't add yourself!")
      end
    end

    it 'user can see viewing parties thay are hosting and are invited to' do
      within("#viewing_parties") do
        expect(page).to have_content('Viewing Parties')
      end

      within("#hosting-#{@party_1.id}") do
        expect(page).to have_content("#{@user_1.email} is invited")
        expect(page).to have_content("#{@user_3.email} is invited")
        expect(page).to have_content("#{@user_4.email} is invited")

        expect(page).to have_button(@party_1.movie_title)
        expect(page).to have_content("12/31/9999")
        expect(page).to have_content("at 01:00PM")
        expect(page).to have_content("#{@party_1.duration} minutes")
      end

      within("#invited_to-#{@party_2.id}") do
        expect(page).to have_button(@party_2.movie_title)
        expect(page).to have_content("Invited by Host: #{@user_1.email}")

        expect(page).to have_content("#{@user_2.email} is invited")
        page.html.should include("<b> bobo1@gmail.com is invited </b>")

        expect(page).to have_button(@party_2.movie_title)
        expect(page).to have_content("10/25/2011")

        expect(page).to have_content("at 03:00PM")
        expect(page).to have_content("#{@party_2.duration} minutes")
      end
    end

    it "clicks movie name and redirects to its show page" do
      click_button(@party_2.movie_title)

      expect(current_path).to eq(movie_details_path)

      expect(page).to have_content("Vote Average: 8.5")
      expect(page).to have_content("Runtime: 2h 13min")
      expect(page).to have_content("Genres: Comedy, Thriller, Drama")
    end
  end
end
