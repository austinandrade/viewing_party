require 'rails_helper'

describe 'user login' do
  before :each do
    @json_first_20 = File.read('spec/fixtures/top_40_movies.json')
    @json_second_20 = File.read('spec/fixtures/top_40_movies_pt_2.json')
    @movie_search = File.read('spec/fixtures/movie_search.json')
    @movie_by_id = File.read('spec/fixtures/movie_by_id.json')
    @movie_by_review = File.read('spec/fixtures/parasite_movie_reviews.json')
    @movie_by_credits = File.read('spec/fixtures/parasite_movie_cast.json')

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


      stub_request(:get, "https://api.themoviedb.org/3/search/movie?api_key=#{ENV['TMD_api_key']}&query=Jack+Reacher").
        with(
          headers: {
      	  'Accept'=>'*/*',
      	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
      	  'User-Agent'=>'Faraday v1.4.1'
          }).
        to_return(status: 200, body: @movie_search, headers: {})

      stub_request(:get, "https://api.themoviedb.org/3/movie/496243?api_key=#{ENV['TMD_api_key']}").
       with(
         headers: {
     	  'Accept'=>'*/*',
     	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
     	  'User-Agent'=>'Faraday v1.4.1'
         }).
       to_return(status: 200, body: @movie_by_id, headers: {})

       stub_request(:get, "https://api.themoviedb.org/3/movie/496243/reviews?api_key=b4a97b956e56881be91c7c5d78622887").
         with(
           headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Faraday v1.4.1'
           }).
         to_return(status: 200, body: @movie_by_review, headers: {})

       stub_request(:get, "https://api.themoviedb.org/3/movie/496243/credits?api_key=b4a97b956e56881be91c7c5d78622887").
         with(
           headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Faraday v1.4.1'
           }).
         to_return(status: 200, body: @movie_by_credits, headers: {})
         
    @user = User.create!(email: 'bobo@gmail.com', password: 'smokeweedeveryday')

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

    visit discover_path
  end

  describe 'logged in user discover page' do
    it 'displays welcome message' do
      expect(page).to have_content("Welcome #{@user.email}!")
    end

    it 'clicks top 40 movies button and redirects to top 40 rates movies path' do
      click_button 'Find Top Rated Movies'
      expect(current_path).to eq(top_40_rated_movies_path)
    end

    it "displays text field to search movies by title, searches and redirects to show page" do
      fill_in :movie_search, with: "Jack Reacher"
      click_button "Search by Movie Title"

      expect(current_path).to eq(movie_path)
    end
  end
end
