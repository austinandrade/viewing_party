class MoviesController < ApplicationController
  def index
    @movies = MoviesFacade.top_movies
  end
end
