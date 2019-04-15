class Api::V1::AntipodesController < Api::V1::BaseController
  def show
    location = LocationFacade.new(params[:loc])
    antipode = Antipode.new(location.latitude, location.longitude)
    antipode_locatin_facade = LocationFacade.new(antipode.location_name)
    binding.pry
  end
end
