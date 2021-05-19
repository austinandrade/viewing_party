require 'rails_helper'

describe 'movie show page' do
  before :each do

    @movie_by_id            = File.read('spec/fixtures/movie_by_id.json')
    @json_first_20          = File.read('spec/fixtures/top_40_movies.json')
    @json_second_20         = File.read('spec/fixtures/top_40_movies_pt_2.json')
    @parasite_movie_cast    = File.read('spec/fixtures/parasite_movie_cast.json')
    @parasite_movie_reviews = File.read('spec/fixtures/parasite_movie_reviews.json')

    stub_request(:get, "https://api.themoviedb.org/3/movie/496243?api_key=#{ENV['TMD_api_key']}").
     with(
       headers: {
      'Accept'=>'*/*',
      'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
      'User-Agent'=>'Faraday v1.4.1'
       }).
     to_return(status: 200, body: @movie_by_id, headers: {})

     stub_request(:get, "https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV['TMD_api_key']}&page=1").
         with(
           headers: {
       	  'Accept'=>'*/*',
       	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       	  'User-Agent'=>'Faraday v1.4.1'
           }).
         to_return(status: 200, body: @json_first_20, headers: {})

     stub_request(:get, "https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV['TMD_api_key']}&page=2").
       with(
         headers: {
     	  'Accept'=>'*/*',
     	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
     	  'User-Agent'=>'Faraday v1.4.1'
         }).
       to_return(status: 200, body: @json_second_20, headers: {})

       stub_request(:get, "https://api.themoviedb.org/3/movie/496243/credits?api_key=#{ENV['TMD_api_key']}").
         with(
           headers: {
       	  'Accept'=>'*/*',
       	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       	  'User-Agent'=>'Faraday v1.4.1'
           }).
         to_return(status: 200, body: @parasite_movie_cast, headers: {})

       stub_request(:get, "https://api.themoviedb.org/3/movie/496243/reviews?api_key=#{ENV['TMD_api_key']}").
        with(
          headers: {
      	  'Accept'=>'*/*',
      	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
      	  'User-Agent'=>'Faraday v1.4.1'
          }).
        to_return(status: 200, body: @parasite_movie_reviews, headers: {})

    @current_user = User.create!(email: 'miketheman@gmail.com', password: 'catskindasuck23')
    @user_2 = User.create!(email: 'bobo1@gmail.com', password: 'smokeweedeveryday')
    @user_3 = User.create!(email: 'bobo2@gmail.com', password: 'smokeweedeveryday')
    @user_4 = User.create!(email: 'bobo3@gmail.com', password: 'smokeweedeveryday')

    @friendship_1 = Friendship.create(follower_id: @current_user.id, followee_id: @user_2.id)
    @friendship_2 = Friendship.create(follower_id: @current_user.id, followee_id: @user_3.id)
    @friendship_3 = Friendship.create(follower_id: @current_user.id, followee_id: @user_4.id)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@current_user)
    visit top_40_rated_movies_path

    click_on("Parasite")
  end

  it "displays movie details and button to create viewing party" do
    summary = "All unemployed, Ki-taek's family takes peculiar interest in the wealthy and glamorous Parks for their livelihood until they get entangled in an unexpected incident."

    expect(page).to have_button("Create Viewing Party For Parasite")
    expect(page).to have_content("Welcome #{@current_user.email}!")
    expect(page).to have_content("Parasite")
    expect(page).to have_content("Vote Average: 8.5")
    expect(page).to have_content("Runtime: 2h 13min")
    expect(page).to have_content("Genres: Comedy, Thriller, Drama")
    expect(page).to have_content("Summary: #{summary}")
    expect(page).to have_content("Song Kang-ho as Kim Ki-taek")
    expect(page).to have_content("Lee Sun-kyun as Park Dong-ik")
    expect(page).to have_content("Cho Yeo-jeong as Yeon-kyo")
    expect(page).to have_content("Review Count: 14")

    within(first("#review")) do
      expect(page).to have_css('.author')
      expect(page).to have_css('.review')
    end
  end
end
