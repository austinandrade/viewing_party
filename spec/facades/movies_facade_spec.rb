require "rails_helper"


describe 'MoviesFacade' do
  before :each do
  @top_20    = File.read('spec/fixtures/top_40_movies.json')
  @top_20_2  = File.read('spec/fixtures/top_40_movies_pt_2.json')
  @upcoming  = File.read('spec/fixtures/upcoming_movies.json')
  @popular   = File.read('spec/fixtures/popular_movies.json')

    stub_request(:get, "https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV['TMD_api_key']}&page=1").
         with(
           headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Faraday v1.4.1'
           }).
         to_return(status: 200, body: @top_20, headers: {})
    
    stub_request(:get, "https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV['TMD_api_key']}&page=2").
            with(
              headers: {
             'Accept'=>'*/*',
             'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
             'User-Agent'=>'Faraday v1.4.1'
              }).
            to_return(status: 200, body: @top_20_2, headers: {})

    stub_request(:get, "https://api.themoviedb.org/3/movie/upcoming?api_key=b4a97b956e56881be91c7c5d78622887").
         with(
           headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Faraday v1.4.1'
           }).
         to_return(status: 200, body: @upcoming, headers: {})

    stub_request(:get, "https://api.themoviedb.org/3/movie/popular?api_key=b4a97b956e56881be91c7c5d78622887").
      with(
        headers: {
       'Accept'=>'*/*',
       'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       'User-Agent'=>'Faraday v1.4.1'
        }).
      to_return(status: 200, body: @popular, headers: {})
  end

  it 'exists' do
    movies_facade = MoviesFacade.new
    expect(movies_facade).to be_an_instance_of(MoviesFacade)
  end

  it 'returns top rated movie Film objects' do
     movies_facade = MoviesFacade.top_movies
     expect(movies_facade.count).to eq(40) 
     expect(movies_facade.first).to be_an_instance_of(Film)
  end

  it 'returns upcoming movie Film objects' do
     movies_facade = MoviesFacade.upcoming_movies
     expect(movies_facade.count).to eq(20) 
     expect(movies_facade.first).to be_an_instance_of(Film)
  end

  it 'returns popular movie Film objects' do
     movies_facade = MoviesFacade.popular_movies
     expect(movies_facade.count).to eq(20) 
     expect(movies_facade.first).to be_an_instance_of(Film)
  end

end