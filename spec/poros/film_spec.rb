require "rails_helper"

describe 'Film' do
  it 'exists' do
    attributes = {
                  :adult=>false,
                  :backdrop_path=>"/iNh3BivHyg5sQRPP1KOkzguEX0H.jpg",
                  :genre_ids=>[18, 80],
                  :id=>278,
                  :original_language=>"en",
                  :original_title=>"The Shawshank Redemption",
                  :overview=>"Framed in the 1940s for the double murder of his wife and her lover, upstanding banker Andy Dufresne begins a new life at the Shawshank prison, where he puts his accounting skills to work for an amoral warden. During his long stretch in prison, Dufresne comes to be admired by the other inmates -- including an older prisoner named Red -- for his integrity and unquenchable sense of hope.",
                  :popularity=>47.01,
                  :poster_path=>"/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg",
                  :release_date=>"1994-09-23",
                  :title=>"The Shawshank Redemption",
                  :video=>false,
                  :vote_average=>8.7,
                  :vote_count=>18918
                 }
    new_film = Film.new(attributes)
    expect(new_film).to be_an_instance_of(Film)
  end
  
  it 'it has attributes' do
    attributes = {
                  :adult=>false,
                  :backdrop_path=>"/iNh3BivHyg5sQRPP1KOkzguEX0H.jpg",
                  :genre_ids=>[18, 80],
                  :id=>278,
                  :original_language=>"en",
                  :original_title=>"The Shawshank Redemption",
                  :overview=>"Framed in the 1940s for the double murder of his wife and her lover, upstanding banker Andy Dufresne begins a new life at the Shawshank prison, where he puts his accounting skills to work for an amoral warden. During his long stretch in prison, Dufresne comes to be admired by the other inmates -- including an older prisoner named Red -- for his integrity and unquenchable sense of hope.",
                  :popularity=>47.01,
                  :poster_path=>"/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg",
                  :release_date=>"1994-09-23",
                  :title=>"The Shawshank Redemption",
                  :video=>false,
                  :vote_average=>8.7,
                  :vote_count=>18918
                 }
    new_film = Film.new(attributes)

    expect(new_film.id).to eq(278)
    expect(new_film.title).to eq("The shawshank redemption")
    expect(new_film.vote_average).to eq(8.7)
    expect(new_film.popularity).to eq(47.01)
    expect(new_film.genres).to eq([18, 80])
    expect(new_film.overview).to eq("Framed in the 1940s for the double murder of his wife and her lover, upstanding banker Andy Dufresne begins a new life at the Shawshank prison, where he puts his accounting skills to work for an amoral warden. During his long stretch in prison, Dufresne comes to be admired by the other inmates -- including an older prisoner named Red -- for his integrity and unquenchable sense of hope.")
    expect(new_film.poster).to eq("/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg")
  end
end