class Api::V1::ForecastController < Api::V1::BaseController
  def show
    location = LocationFacade.new(params[:location])

    render json: LocationFacadeSerializer.new(location), cached: true
  end
end
