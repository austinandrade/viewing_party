class Film
  attr_reader :title,
              :id,
              :vote_average,
              # :runtime,
              :popularity,
              :genres,
              :overview,
              :cast,
              :poster,
              :reviews

  def initialize(data)
    @id           = data[:id]
    @title        = data[:title].capitalize
    @vote_average = data[:vote_average]
    # @runtime      = data[:runtime]
    @popularity   = data[:popularity]
    @genres       = data[:genre_ids]
    @overview     = data[:overview]
    @poster       = data[:poster_path]
  end
end