class FavoriteFacade < LocationFacade
  attr_reader :location,
              :current_weather,
              :latitude,
              :longitude,
              :city_and_state

  def current_weather
    forecast["currently"]
  end

  def location
    city_and_state
  end

end
