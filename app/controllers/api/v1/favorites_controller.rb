class Api::V1::FavoritesController < Api::V1::BaseController
  def create
    user = User.find_by(api_key: favorite_params[:api_key])
    if user
      location = LocationFacade.new(favorite_params[:location]).get_or_create_location
      rescue_favorite_not_unique(user, location)
    else
      render status: 401, json: { "errors": "There's a problem with your api key"}
    end
  end

  def index
    user = User.find_by(api_key: list_favorites_params[:api_key])
    if user
      locations = FavoritesListFacade.new(user).favorites_facades
      render json: FavoriteFacadeSerializer.new(locations).serialized_json
    else
      render json: { }, status: 401
    end
  end

  private

  def list_favorites_params
    params.permit(:api_key)
  end

  def favorite_params
    params.permit(:location, :api_key)
  end

  def create_json(locations)
    locations.each do |location|
    end 


  end

  def rescue_favorite_not_unique(user, location)
    begin
      favorite = Favorite.new(user: user, location: location)
      favorite.save
      render status: 201, json: {}
    rescue ActiveRecord::RecordNotUnique
      render status: 400, json: { "errors": "That location is already in your favorites"}
    end

  end
end
