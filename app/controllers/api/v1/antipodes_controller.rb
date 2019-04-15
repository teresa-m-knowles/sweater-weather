class Api::V1::AntipodesController < Api::V1::BaseController
  def show
    location = LocationFacade.new(params[:loc])
    binding.pry
    antipode = AntipodeFacade.new(location,location.latitude, location.longitude)
    binding.pry
  end
end
