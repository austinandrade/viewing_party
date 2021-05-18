require "rails_helper"

describe 'SoloFilm' do
  it 'exists' do

    new_film = SoloFilm.new(parasite_movie_search_by_id)
    expect(new_film).to be_an_instance_of(SoloFilm)
  end

  it 'it has attributes' do
    new_film = SoloFilm.new(parasite_movie_search_by_id, parasite_movie_review_info, parasite_movie_cast)

    expect(new_film.id).to eq(496243)
    expect(new_film.title).to eq('Parasite')
    expect(new_film.genres).to eq("Comedy, Thriller, Drama")
    expect(new_film.runtime).to eq("2h 13min")
    expect(new_film.vote_average).to eq(8.5)
    expect(new_film.summary).to eq("All unemployed, Ki-taek's family takes peculiar interest in the wealthy and glamorous Parks for their livelihood until they get entangled in an unexpected incident.")
    expect(new_film.review_count).to eq(14)
    expect(new_film.reviews).to be_an(Array)
    expect(new_film.cast.count).to eq(10)
  end
end
