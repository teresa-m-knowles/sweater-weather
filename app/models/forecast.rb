class Forecast
  attr_reader :location,
              :id

  def initialize(city_and_state)
    @location = city_and_state
    @id = 1
  end

  def long
    geometry_location[:lng]
  end

  def lat
    geometry_location[:lat]
  end

  def geometry_location
    service.lat_lng(@location)[:results][0][:geometry][:location]
  end

  def service
    GeocodingService.new
  end
end
