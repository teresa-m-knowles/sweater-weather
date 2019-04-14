class Location < ApplicationRecord
  validates_presence_of :city_and_state
  validates_presence_of :longitude
  validates_presence_of :latitude
end
