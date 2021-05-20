class MoviesController < ApplicationController
  def index
    @movies = if params[:movie_search]
                MoviesFacade.search_by_movie(params[:movie_search])
              else
                MoviesFacade.top_movies
              end
  end
  
  def upcoming_movies
    @movies = MoviesFacade.upcoming_movies
  end

  def popular_movies
    @movies = MoviesFacade.popular_movies
  end

  def show
    @movie = MoviesFacade.search_by_movie_id(params[:movie_id])
  end
end
