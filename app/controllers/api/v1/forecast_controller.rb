class Api::V1::ForecastController < ApplicationController
  def show
    forecast =  Forecast.new(params[:location])
    binding.pry
    render json: ForecastSerializer.new(forecast)
  end
end
