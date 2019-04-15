class AntipodeFacade < LocationFacade
  attr_reader :opp_lat,
              :opp_long,
              :latitude,
              :longitude,
              :location_name,
              :search_location

  def initialize(search_location, opp_lat, opp_long)
    @id = 1
    @opp_lat = opp_lat
    @opp_long = opp_long
    coords
    location_name
    @search_location = search_location
  end

  def coords
    coords = amypode_service.antipode_coords
    @latitude = coords[:data][:attributes][:lat]
    @longitude = coords[:data][:attributes][:long]
  end

  def amypode_service
    AmypodeService.new(@opp_lat, @opp_long)
  end

  def location_name
    location = ReverseGeocodeService.new(@latitude, @longitude).get_location
    location[:results][0][:formatted_address]
  end

  def forecast
    {"summary": super["currently"]["summary"],
     "current_temperature": super["currently"]["temperature"]}
  end


end
