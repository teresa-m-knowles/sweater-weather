class Api::V1::BackgroundsController < Api::V1::BaseController
  def show
    location = LocationFacade.new(params[:location])

    render json: BackgroundImageSerializer.new(location), cached: true
  end
end
