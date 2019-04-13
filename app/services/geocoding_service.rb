class GeocodingService
  def conn
    Faraday.new(url: 'https://maps.googleapis.com/maps/api/geocode/json?') do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end

  def lat_lng(city_and_state)
    key = ENV['geocoding_api_key']
    response = conn.get("?address=#{city_and_state}&key=#{key}")
    JSON.parse(response.body, symbolize_names: true)[:results][0][:geometry][:location]
  end

end
