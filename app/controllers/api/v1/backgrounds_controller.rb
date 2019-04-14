class Api::V1::BackgroundsController < Api::V1::BaseController
  def show
    background = BackgroundImageFacade.new(params[:location])

    render json: BackgroundImageSerializer.new(background)
  end
end
