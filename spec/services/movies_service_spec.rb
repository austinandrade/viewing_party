require "rails_helper"


describe 'MoviesService' do
  it 'exists' do
    movies_service = MoviesService.new
    expect(movies_service).to be_an_instance_of(MoviesService)
  end

  it 'can retrieve results' do
    expect(movie_service_json).to be_a(Hash)
    expect(movie_service_json).to have_key(:results)
    expect(movie_service_json[:results]).to be_an(Array)
  end

  it 'returns correct data structure and type' do
    expect(movie_service_json[:results][0]).to have_key(:id)
    expect(movie_service_json[:results][0][:id]).to be_a(Integer)

    expect(movie_service_json[:results][0]).to have_key(:title)
    expect(movie_service_json[:results][0][:title]).to be_a(String)

    expect(movie_service_json[:results][0]).to have_key(:vote_average)
    expect(movie_service_json[:results][0][:vote_average]).to be_a(Float)

    expect(movie_service_json[:results][0]).to have_key(:popularity)
    expect(movie_service_json[:results][0][:popularity]).to be_a(Float)

    expect(movie_service_json[:results][0]).to have_key(:genre_ids)
    expect(movie_service_json[:results][0][:genre_ids]).to be_an(Array)

    expect(movie_service_json[:results][0]).to have_key(:overview)
    expect(movie_service_json[:results][0][:overview]).to be_a(String)

    expect(movie_service_json[:results][0]).to have_key(:poster_path)
    expect(movie_service_json[:results][0][:poster_path]).to be_a(String)
  end

end