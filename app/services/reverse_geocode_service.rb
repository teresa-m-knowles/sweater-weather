class ReverseGeocodeService
  attr_reader :lat,
              :long
  def initialize(lat,long)
    @lat = lat
    @long = long
  end

  def conn
    Faraday.new(url: 'https://maps.googleapis.com/maps/api/geocode/json') do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end

  def get_json(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_location
    url = "?latlng=#{@lat},#{@long}&key=#{ENV['geocoding_api_key']}"
    get_json(url)
  end
end
