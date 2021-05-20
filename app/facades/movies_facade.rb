class MoviesFacade
  class << self
    def top_movies
      create_movies(MoviesService.top_rated_movies)
    end
    
    def search_by_movie(movie_search)
      create_movies(MoviesService.search_db_my_movie(movie_search)[:results])
    end
    
    def search_by_movie_id(movie_id)
      SoloFilm.new(
        MoviesService.search_db_by_movie_id(movie_id),
        MoviesService.search_movie_review_db(movie_id),
        MoviesService.search_movie_cast_db(movie_id)
      )
    end
    
    def upcoming_movies
      create_movies(MoviesService.upcoming_movies[:results])
    end

    def popular_movies
      create_movies(MoviesService.popular_movies[:results])
    end

    private

    def create_movies(movies_data)
      movies_data.map do |movie_data|
        Film.new(movie_data)
      end
    end
  end
end
