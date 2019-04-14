class Api::V1::ForecastController < ApplicationController
  def show
    location = Location.new(params[:location])
    
    render json: LocationSerializer.new(location)
  end
end
