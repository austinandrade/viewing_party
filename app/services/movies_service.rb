class MoviesService
  class << self

    def top_rated_movies
      prepare_json('/3/movie/top_rated')
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
