class LocationFacade

  attr_reader :longitude,
              :latitude,
              :city,
              :state,
              :country,
              :id,
              :city_and_state,
              :image_url

  def initialize(city_and_state)
    @id = 1
    @city_and_state = city_and_state
    @longitude = geometry_location[:lng]
    @latitude = geometry_location[:lat]
    @city = geo_service.get_location[:results][0][:address_components][0][:long_name]
    @state = state
    @country = country
  end

  def country
    geo_service.get_location[:results][0][:address_components][3]
    if geo_service.get_location[:results][0][:address_components][3]
      return geo_service.get_location[:results][0][:address_components][3][:long_name]
    end

  end

  def state
    if geo_service.get_location[:results][0][:address_components][2]
      return geo_service.get_location[:results][0][:address_components][2][:short_name]
    end
  end

  def get_or_create_location
    location = Location.find_by(city_and_state: "#{@city}, #{@state}")

    unless location
      location = Location.create!(
        city_and_state: "#{@city}, #{@state}",
        longitude: @longitude,
        latitude: @latitude,
        image_url: @image_url)
    end
    return location

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

  def bing_service
    BingImageService.new(@city_and_state)
  end

  def image_url
    bing_service.image_url["value"][0]["contentUrl"]
  end

  def formatted_address
    geo_service.get_location[:results][0][:formatted_address]
  end

end
