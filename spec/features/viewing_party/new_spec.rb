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

  it "clicks create viewing party, redirects to viewing_party/new page, and displays form" do
    click_button("Create Viewing Party For Parasite")

    expect(current_path).to eq(new_viewing_party_path)
    expect(page).to have_content("Welcome #{@current_user.email}!")
    expect(find_field(:movie_title).value).to eq 'Parasite'
    expect(find_field(:duration).value).to eq '133'
    expect(page).to have_field(:date)
    expect(page).to have_field('bobo1@gmail.com')
    expect(page).to have_field('bobo2@gmail.com')
    expect(page).to have_field('bobo3@gmail.com')

    click_button("Create Party")
    expect(current_path).to eq(create_viewing_party_path)
  end

  describe 'viewing party creation' do
    it 'fills in form, clicks create viewing party, and viewing party and viewing party guest records are created' do
      click_button("Create Viewing Party For Parasite")

      fill_in :duration, with: "150"
      fill_in :date, with: "2021/08/18"
      fill_in :start_time, with: "07:00 PM"

      check 'bobo1@gmail.com'
      check 'bobo2@gmail.com'

      click_button("Create Party")
      expect(current_path).to eq(dashboard_path)

      viewing_party = Party.last

      expect(viewing_party.movie_title).to eq("Parasite")
      expect(viewing_party.duration).to eq(150)
      expect(viewing_party.date).to eq("2021/08/18".to_date)
      expect(viewing_party.start_time.to_time.strftime('%I:%M %p')).to eq("07:00 PM")
    end

    it "doesnt fill in form, clicks create viewing party, and redirects with sad path message" do
      click_button("Create Viewing Party For Parasite")

      click_button("Create Party")

      expect(current_path).to eq(create_viewing_party_path)
      expect(page).to have_content('Please fill in all fields and choose at least one friend.')
    end
  end
end
