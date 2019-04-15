class AmypodeService
  attr_reader :opp_lat,
              :opp_long

  def initialize(opp_lat, opp_long)
    @opp_lat = opp_lat
    @opp_long = opp_long
  end

  def conn
    Faraday.new(url: 'http://amypode.herokuapp.com/api/v1/antipodes') do |faraday|
      faraday.adapter Faraday.default_adapter
      
    end

  end
end
