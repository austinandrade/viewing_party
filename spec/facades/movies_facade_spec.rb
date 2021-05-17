require "rails_helper"


describe 'MoviesFacade' do
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