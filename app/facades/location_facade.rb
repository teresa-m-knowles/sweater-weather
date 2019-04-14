class LocationFacade

  attr_reader :longitude,
              :latitude,
              :city,
              :state,
              :country,
              :id,
              :city_and_state

  def initialize(city_and_state)
    @id = 1
    @city_and_state = city_and_state
    @longitude = geometry_location[:lng]
    @latitude = geometry_location[:lat]
    @city = geo_service.get_location[:results][0][:address_components][0][:long_name]
    @state = geo_service.get_location[:results][0][:address_components][2][:short_name]
    @country = geo_service.get_location[:results][0][:address_components][3][:long_name]
  end

  def geometry_location
    @geometry_location ||= geo_service.lat_lng
  end

  def forecast
    weather_service.get_forecast(latitude, longitude)
  end

  def geo_service
    GeocodingService.new(@city_and_state)
  end

  def weather_service
    DarkSkyService.new
  end

end
