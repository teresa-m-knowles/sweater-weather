class LocationSerializer
  include FastJsonapi::ObjectSerializer
  set_type :location
  attributes :city,
             :state,
             :country,
             :forecast
end
