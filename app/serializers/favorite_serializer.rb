class FavoriteSerializer
  include FastJsonapi::ObjectSerializer

  attributes :city_and_state,
             :state,
             :country,
             :forecast
end
