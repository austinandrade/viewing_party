class MoviesFacade
  class << self
    def top_movies
      create_movies(MoviesService.top_rated_movies)
    end

    private

    def create_movies(movies_data)
      movies_data.map do |movie_data|
        Film.new(movie_data)
      end
    end

  end
end
