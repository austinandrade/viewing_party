class MoviesController < ApplicationController
  def index
    if params[:movie_search]
      @movies = MoviesFacade.search_by_movie(params[:movie_search])
    else
      @movies = MoviesFacade.top_movies
    end
  end

  def show
    @movie = MoviesFacade.search_by_movie_id(params[:movie_id])
  end
end
