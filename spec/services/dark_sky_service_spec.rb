require 'rails_helper'

RSpec.describe 'Dark sky service' do
  it 'exists' do
    dark_sky_service = DarkSkyService.new

    expect(dark_sky_service).to be_a(DarkSkyService)
  end

  it 'gets the forecast' do
    dark_sky_service = DarkSkyService.new
    denver_lat = 39.7392358
    denver_long = -104.990251
    binding.pry
    dark_sky_service.get_forecast(denver_lat, denver_long)
  end
end
