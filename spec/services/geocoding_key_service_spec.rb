require 'rails_helper'

RSpec.describe 'Geocoding Service' do
  it 'exists' do
    geocoding_service = GeocodingService.new('denver,co')

    expect(geocoding_service).to be_a(GeocodingService)
  end

  it 'can get latitude and longitude' do
    geocoding_service = GeocodingService.new('denver,co')

    denver_lat_long = {
                  lat: 39.7392358,
                  lng: -104.990251
                      }
    expect(geocoding_service.lat_lng).to eq(denver_lat_long)

  end
end
