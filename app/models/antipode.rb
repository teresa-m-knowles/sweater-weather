class Antipode
  attr_reader :opp_lat,
              :opp_long,
              :latitude,
              :longitude

  def initialize(opp_lat, opp_long)
    @opp_lat = opp_lat
    @opp_long = opp_long
    coords
  end

  def coords
    coords = amypode_service.antipode_coords
    @latitude = coords[:data][:attributes][:lat]
    @longitude = coords[:data][:attributes][:long]
  end

  def amypode_service
    AmypodeService.new(@opp_lat, @opp_long)

  end
end
