class LocationSerializer
  include FastJsonapi::ObjectSerializer
  
  attributes :city,
             :state,
             :country,
             :forecast
end
