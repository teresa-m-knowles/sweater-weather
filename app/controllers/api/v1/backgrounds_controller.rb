class Api::V1::BackgroundsController < ApplicationController
  def show
    background = BackgroundImage.new(params[:location])
    
    render json: BackgroundImageSerializer.new(background)
  end
end
