require "rails_helper"


describe 'MoviesService' do
  it 'exists' do
    movies_service = MoviesService.new
    expect(movies_service).to be_an_instance_of(MoviesService)
  end

  it 'can retrieve top 40 movies results' do
    expect(top_movies_service_json).to be_a(Hash)
    expect(top_movies_service_json).to have_key(:results)
    expect(top_movies_service_json[:results]).to be_an(Array)
  end
  
  it 'returns correct top 40 movies data structure and type' do
    expect(top_movies_service_json[:results][0]).to have_key(:id)
    expect(top_movies_service_json[:results][0][:id]).to be_a(Integer)
    
    expect(top_movies_service_json[:results][0]).to have_key(:title)
    expect(top_movies_service_json[:results][0][:title]).to be_a(String)
    
    expect(top_movies_service_json[:results][0]).to have_key(:vote_average)
    expect(top_movies_service_json[:results][0][:vote_average]).to be_a(Float)
    
    expect(top_movies_service_json[:results][0]).to have_key(:popularity)
    expect(top_movies_service_json[:results][0][:popularity]).to be_a(Float)
    
    expect(top_movies_service_json[:results][0]).to have_key(:genre_ids)
    expect(top_movies_service_json[:results][0][:genre_ids]).to be_an(Array)
    
    expect(top_movies_service_json[:results][0]).to have_key(:overview)
    expect(top_movies_service_json[:results][0][:overview]).to be_a(String)
    
    expect(top_movies_service_json[:results][0]).to have_key(:poster_path)
    expect(top_movies_service_json[:results][0][:poster_path]).to be_a(String)
  end
  
  it 'can retrieve popular movies results' do
    expect(popular_movies_service_json).to be_a(Hash)
    expect(popular_movies_service_json).to have_key(:results)
    expect(popular_movies_service_json[:results]).to be_an(Array)
  end
  
  it 'returns correct popular movies data structure and type' do
    expect(top_movies_service_json[:results][0]).to have_key(:id)
    expect(top_movies_service_json[:results][0][:id]).to be_a(Integer)
    
    expect(top_movies_service_json[:results][0]).to have_key(:title)
    expect(top_movies_service_json[:results][0][:title]).to be_a(String)
    
    expect(top_movies_service_json[:results][0]).to have_key(:vote_average)
    expect(top_movies_service_json[:results][0][:vote_average]).to be_a(Float)
    
    expect(top_movies_service_json[:results][0]).to have_key(:popularity)
    expect(top_movies_service_json[:results][0][:popularity]).to be_a(Float)
    
    expect(top_movies_service_json[:results][0]).to have_key(:genre_ids)
    expect(top_movies_service_json[:results][0][:genre_ids]).to be_an(Array)
    
    expect(top_movies_service_json[:results][0]).to have_key(:overview)
    expect(top_movies_service_json[:results][0][:overview]).to be_a(String)
    
    expect(top_movies_service_json[:results][0]).to have_key(:poster_path)
    expect(top_movies_service_json[:results][0][:poster_path]).to be_a(String)
  end
  
  it 'can retrieve upcoming movies results' do
    expect(upcoming_movies_service_json).to be_a(Hash)
    expect(upcoming_movies_service_json).to have_key(:results)
    expect(upcoming_movies_service_json[:results]).to be_an(Array)
  end

  it 'returns correct upcoming movies data structure and type' do
    expect(top_movies_service_json[:results][0]).to have_key(:id)
    expect(top_movies_service_json[:results][0][:id]).to be_a(Integer)
    
    expect(top_movies_service_json[:results][0]).to have_key(:title)
    expect(top_movies_service_json[:results][0][:title]).to be_a(String)
    
    expect(top_movies_service_json[:results][0]).to have_key(:vote_average)
    expect(top_movies_service_json[:results][0][:vote_average]).to be_a(Float)
    
    expect(top_movies_service_json[:results][0]).to have_key(:popularity)
    expect(top_movies_service_json[:results][0][:popularity]).to be_a(Float)
    
    expect(top_movies_service_json[:results][0]).to have_key(:genre_ids)
    expect(top_movies_service_json[:results][0][:genre_ids]).to be_an(Array)
    
    expect(top_movies_service_json[:results][0]).to have_key(:overview)
    expect(top_movies_service_json[:results][0][:overview]).to be_a(String)
    
    expect(top_movies_service_json[:results][0]).to have_key(:poster_path)
    expect(top_movies_service_json[:results][0][:poster_path]).to be_a(String)
  end
end
