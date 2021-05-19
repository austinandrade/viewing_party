class MoviesService
  class << self

    def top_rated_movies
      prepare_json('/3/movie/top_rated')
    end

    def search_db_my_movie(movie_search)
      response = conn.get("3/search/movie?query=#{movie_search}")
      parse_data(response)
    end

    def search_db_by_movie_id(movie_id)
      response = conn.get("3/movie/#{movie_id}")
      parse_data(response)
    end

    def search_movie_cast_db(movie_id)
      response = conn.get("3/movie/#{movie_id}/credits")
      parse_data(response)
    end

    def search_movie_review_db(movie_id)
      response = conn.get("3/movie/#{movie_id}/reviews")
      parse_data(response)
    end

    private

    def conn
      Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
        faraday.params['api_key'] = ENV['TMD_api_key']
      end
    end

    def parse_data(response)
      JSON.parse(response.body, symbolize_names: true)
    end

    def prepare_json(path)
      page  = 1
      array = []
      2.times do
        response = conn.get(path) do |req|
          req.params[:page] = page
          page += 1
        end
        array << parse_data(response)[:results]
      end
      array.flatten!
    end

  end
end
