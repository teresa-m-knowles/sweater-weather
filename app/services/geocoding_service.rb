class GeocodingService

  attr_reader :city, :state, :country

  def initialize(city_and_state)
    @city_and_state = city_and_state
  end

  def conn
    Faraday.new(url: 'https://maps.googleapis.com/maps/api/geocode/json?') do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end

  def lat_lng
    get_location[:results][0][:geometry][:location]
  end

  def get_json(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_location
    key = ENV['geocoding_api_key']
    url = "?address=#{@city_and_state}&key=#{key}"
    get_json(url)
  end

end
