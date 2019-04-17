class Api::V1::AntipodesController < Api::V1::BaseController
  def show
    location = LocationFacade.new(params[:loc])

    antipode = AntipodeFacade.new(location.formatted_address, location.latitude, location.longitude)

    render json: AntipodeSerializer.new(antipode), cached: true
  end
end
