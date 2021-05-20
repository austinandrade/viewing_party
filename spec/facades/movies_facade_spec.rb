require "rails_helper"


describe 'MoviesFacade' do
  before :each do
  @top_20 = File.read('spec/fixtures/top_40_movies.json')
  @top_20_2 = File.read('spec/fixtures/top_40_movies_pt_2.json')
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

end