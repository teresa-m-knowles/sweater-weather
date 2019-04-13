class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :lat, :long
end
