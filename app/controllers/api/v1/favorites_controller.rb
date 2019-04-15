class Api::V1::FavoritesController < Api::V1::BaseController
  def create
    user = User.find_by(api_key: favorites_params[:api_key])
    if user
      location_facade = LocationFacade.new(favorites_params[:location])
      location = location_facade.get_or_create_location

      begin
        favorite = Favorite.new(user: user, location: location)
        favorite.save
        render status: 201, json: {}
      rescue ActiveRecord::RecordNotUnique
        render status: 400, json: { "errors": "That location is already in your favorites"}
      end


    else
      render status: 401, json: { "errors": "There's a problem with your api key"}
    end
  end

  def favorites_params
    params.permit(:location, :api_key)
  end
end
