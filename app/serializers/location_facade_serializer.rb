class LocationFacadeSerializer
  include FastJsonapi::ObjectSerializer

  attributes :city,
             :state,
             :country,
             :forecast
end
