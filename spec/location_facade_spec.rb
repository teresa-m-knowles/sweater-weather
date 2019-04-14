require 'rails_helper'

RSpec.describe LocationFacade do
  before :each do
    @location = LocationFacade.new('denver,co')
  end

  it 'exists' do
    expect(@location).to be_a(LocationFacade)
  end

  context 'instance methods' do
    it 'can get its geometry location (lat/long)' do
      lat_long = {lat: 39.7392358, lng: -104.990251}
      expect(@location.geometry_location).to eq(lat_long)
    end

    it 'can get the weather forecast' do
      forecast = @location.forecast
      expect(forecast).to have_key("currently")
      expect(forecast["currently"]).to have_key("summary")
    end

    it 'has a city' do
      expect(@location.city).to eq("Denver")
    end

    it 'has a state' do
      expect(@location.state).to eq("CO")
    end

    it 'has a country' do
      expect(@location.country).to eq("United States")
    end

    it 'has a latitude' do
      expect(@location.latitude).to eq(39.7392358)
    end

    it 'has a longitude' do
      expect(@location.longitude).to eq(-104.990251)
    end


  end


end
