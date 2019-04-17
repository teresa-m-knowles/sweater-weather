class FavoritesListSerializer
  include FastJsonapi::ObjectSerializer
  set_type :favorites
  attribute :locations do |location|
     {
       location: location.formatted_address,
       current_weather: location.current_weather
     }
  end
end
