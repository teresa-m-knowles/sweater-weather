class FavoriteFacadeSerializer
  include FastJsonapi::ObjectSerializer

  attributes :location,
             :current_weather
end
