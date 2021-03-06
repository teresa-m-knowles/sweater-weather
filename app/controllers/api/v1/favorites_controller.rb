class Api::V1::FavoritesController < Api::V1::BaseController
  before_action :find_user
  def create
    location = LocationFacade.new(favorite_params[:location]).get_or_create_location
    rescue_favorite_not_unique(@user, location)
  end

  def destroy
    location = FavoriteFacade.new(favorite_params[:location]).get_or_create_location
    favorite = Favorite.find_by(location_id: location.id, user_id: @user.id)
    favorite.destroy
    locations = FavoritesListFacade.new(@user).favorites_facades
    render json: FavoritesListSerializer.new(locations)
  end

  def index
    locations = FavoritesListFacade.new(@user).favorites_facades
    render json: FavoritesListSerializer.new(locations)
  end

  private

  def find_user
    @user = User.find_by(api_key: list_favorites_params[:api_key])
    if @user
      return @user
    else
      render status: 401, json: { "errors": "There's a problem with your api key"}
    end
  end

  def list_favorites_params
    params.permit(:api_key)
  end

  def favorite_params
    params.permit(:location, :api_key)
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
