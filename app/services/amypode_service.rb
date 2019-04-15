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


  def antipode_coords
    response = conn.get do |req|
      req.url "?lat=#{@opp_lat}&long=#{@opp_long}"
      req.headers['api_key'] = ENV['ANTIPODE_KEY']
    end

    JSON.parse(response.body, symbolize_names: true)
  end
end
