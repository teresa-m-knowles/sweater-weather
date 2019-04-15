require 'rails_helper'

RSpec.describe AmypodeService do
  before :each do
    latitude_of_hong_kong = 22.3193 #google search value
    longitude_of_hong_kong = 114.1694 #google search value
    @service = AmypodeService.new(latitude_of_hong_kong, longitude_of_hong_kong)
  end

  it 'exists' do
    expect(@service).to be_a(AmypodeService)
  end

  it 'gets the antipode_coords' do
    lat_of_antipode_in_arg = -22.350627 #google search value
    long_of_antipode_in_arg = -65.815084 #google search value
    expect(@service.antipode_coords[:data][:attributes][:lat]).to be_within(0.1).of(lat_of_antipode_in_arg)
    expect(@service.antipode_coords[:data][:attributes][:long]).to be_within(0.1).of(long_of_antipode_in_arg)
  end

  it 'can establish a connection' do
    expect(@service.conn.url_prefix.host).to eq("amypode.herokuapp.com")
    expect(@service.conn.url_prefix.path).to eq("/api/v1/antipodes")
  end

end
