require 'rails_helper'

describe 'movies index' do
  before :each do
    @user = User.create!(email: 'bobo@gmail.com', password: 'smokeweedeveryday')
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

       stub_request(:get, "https://api.themoviedb.org/3/movie/496243/reviews?api_key=#{ENV['TMD_api_key']}").
         with(
           headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Faraday v1.4.1'
           }).
         to_return(status: 200, body: @movie_by_review, headers: {})

       stub_request(:get, "https://api.themoviedb.org/3/movie/496243/credits?api_key=#{ENV['TMD_api_key']}").
         with(
           headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Faraday v1.4.1'
           }).
         to_return(status: 200, body: @movie_by_credits, headers: {})

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end
  it "clicks discover movies as an authenticated user and is redirected to the discover page" do
    visit dashboard_path

    click_button 'Discover Movies'
    expect(current_path).to eq(discover_path)
  end

  it "displays the top 40 movies names, and their voting averages" do
    visit top_40_rated_movies_path

    expect(page).to have_content("Movie Count: 40")
    expect(page).to have_content('Vote Average: 8.7')
    expect(page).to have_content('Dilwale dulhania le jayenge')

    expect(page).to have_content('Vote Average: 8.4')
    expect(page).to have_content('Clouds')
  end

  it "displays text field to search movies by title, searches and redirects to show page" do
    visit top_40_rated_movies_path

    fill_in :movie_search, with: "Jack Reacher"
    click_button "Search by Movie Title"

    expect(current_path).to eq(movie_path)
  end

  describe 'movies search' do
    it "displays all movies that match the movies search" do
      visit top_40_rated_movies_path

      fill_in :movie_search, with: "Jack Reacher"
      click_button "Search by Movie Title"

      expect(page).to have_content('Jack reacher')
      expect(page).to have_content('Vote Average: 6.5')

      expect(page).to have_content('Jack reacher: never go back')
      expect(page).to have_content('Vote Average: 5.8')
    end
  end

  it "clicks a movie and redirects to its show page" do
    visit top_40_rated_movies_path

    click_on("Parasite")
    expect(current_path).to eq(movie_details_path)
  end
end
