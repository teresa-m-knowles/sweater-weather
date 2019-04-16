class AntipodeSerializer
  include FastJsonapi::ObjectSerializer
  set_type :antipode

  attributes :location_name,
             :forecast

  attribute :forecast do |antipode|
    {"summary": antipode.forecast["currently"]["summary"],
     "current_temperature": antipode.forecast["currently"]["temperature"]}
  end

  meta do |antipode|
    {
      search_location: antipode.search_location
    }
  end

end
