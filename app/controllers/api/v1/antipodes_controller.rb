class Api::V1::AntipodesController < Api::V1::BaseController
  def show
    location = LocationFacade.new(params[:loc])
    antipode = Antipode.new(location.latitude, location.longitude)
    binding.pry
  end
end
