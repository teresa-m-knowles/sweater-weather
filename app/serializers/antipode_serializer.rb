class AntipodeSerializer
  include FastJsonapi::ObjectSerializer
  set_type :antipode

  attributes :location_name,
             :forecast

  meta do |antipode|
    {
      search_location: antipode.search_location
    }
  end

end
