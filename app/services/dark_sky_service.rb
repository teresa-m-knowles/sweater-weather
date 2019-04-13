class DarkSkyService
  def conn
    Faraday.new(url:"https://api.darksky.net") do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end

  def get_forecast(lat, long)
    key = ENV['dark_sky_api_key']
    response = conn.get("forecast/#{key}/#{lat},#{long}?exclude=[minutely,alerts,flags]")
    JSON.parse(response.body)
  end
end
