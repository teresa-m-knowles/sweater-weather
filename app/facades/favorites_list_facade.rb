class FavoritesListFacade
  def initialize(user)
    @user = user
  end

  def favorites_addresses
     @user.locations.map do |location|
      location.city_and_state
    end
  end

  def locations_facades
    favorites_addresses.map do |favorite_location|
      LocationFacade.new(favorite_location)
    end
  end

  def favorites_facades
    locations_facades.map do |location_facade|
      FavoriteFacade.new(location_facade.city_and_state)
    end

  end
end
