require 'rails_helper'

RSpec.describe 'Location Serializer' do
  before :each do
    @location = Location.new('denver,co')
    @serializer = LocationSerializer.new(@location)
  end
  it 'exists' do
    expect(@serializer).to be_a(LocationSerializer)
  end

  it 'has attributes' do
    city = @serializer.serializable_hash[:data][:attributes][:city]
    state = @serializer.serializable_hash[:data][:attributes][:state]
    country = @serializer.serializable_hash[:data][:attributes][:country]

    expect(city).to eq(@location.city)
    expect(state).to eq(@location.state)
    expect(country).to eq(@location.country)
    expect(@serializer.serializable_hash[:data][:attributes]).to have_key(:forecast)
  end
end
