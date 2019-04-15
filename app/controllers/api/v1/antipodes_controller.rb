class Api::V1::AntipodesController < Api::V1::BaseController
  def show
    location = LocationFacade.new(params[:loc])
    binding.pry

  end
end
