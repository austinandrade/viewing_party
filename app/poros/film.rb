class Film
  attr_reader :title,
              :id,
              :vote_average,
              :popularity,
              :genres,
              :overview,
              :cast,
              :poster,
              :reviews

  def initialize(data)
    @id           = data[:id]
    @genre_ids =
    @title        = data[:title].capitalize
    @vote_average = data[:vote_average]
    @popularity   = data[:popularity]
    @genres       = data[:genre_ids]
    @overview     = data[:overview]
    @poster       = data[:poster_path]
  end
end
