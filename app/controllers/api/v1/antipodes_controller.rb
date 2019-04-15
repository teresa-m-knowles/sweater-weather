class Api::V1::AntipodesController < Api::V1::BaseController
  def show
    location = LocationFacade.new(params[:loc])
    binding.pry
    antipode = Antipode.new(location.latitude, location.longitude)

  end
end
