class FavoriteFacade < LocationFacade
  attr_reader :location,
              :current_weather,
              :latitude,
              :longitude,
              :city_and_state

  def current_weather
    forecast["currently"]
  end

  def id
    Favorite.find_by(location_id: get_or_create_location.id).id
  end


end
