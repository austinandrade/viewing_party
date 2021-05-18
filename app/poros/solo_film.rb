class SoloFilm
  attr_reader :id,
              :genres,
              :runtime,
              :title,
              :overview,
              :summary,
              :vote_average,
              :cast,
              :reviews,
              :review_count
  def initialize(data, review_data = {}, cast_data = {})
    @id           = data[:id]
    @genres       = get_genres(data[:genres])
    @runtime      = convert_runtime_into_hours_minutes(data[:runtime])
    @vote_average = data[:vote_average]
    @summary      = data[:overview]
    @title        = data[:title].capitalize
    @cast         = get_cast(cast_data[:cast][0..9]) if cast_data[:cast]
    @reviews      = get_reviews(review_data[:results]) if review_data[:results]
    @review_count = review_data[:results].count if review_data[:results]
  end

  def get_genres(data)
    data.map do |id|
      id[:name]
    end.join(', ')
  end

  def get_cast(cast_data)
    cast_data.map do |actor|
      "#{actor[:name]} as #{actor[:character]}"
    end
  end

  def convert_runtime_into_hours_minutes(runtime_as_integer)
    "#{runtime_as_integer / 60}h #{runtime_as_integer % 60}min"
  end

  def get_reviews(review_data)
    review_data.map do |review|
      [review[:author], review[:content]]
    end
  end
end
