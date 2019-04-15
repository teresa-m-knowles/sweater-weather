class Antipode
  attr_reader :opp_lat,
              :opp_long

  def initialize(opp_lat, opp_long)
    @opp_lat = opp_lat
    @opp_long = opp_long
  end

  def coords
    amypode_service.get_antipode
  end

  def amypode_service
    AmypodeService.new(@opp_lat, @opp_long)

  end
end
