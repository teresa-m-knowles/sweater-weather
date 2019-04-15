require 'rails_helper'

RSpec.describe AntipodeFacade do
  before :each do
    @antipode = AntipodeFacade.new('Hong Kong', 22.3193039, 114.1693611)
  end
  it 'exists' do
    expect(@antipode).to be_a(AntipodeFacade)
  end

  it 'has a latitude and longitude of the opposite city' do
    latitude_of_hong_kong = 22.3193 #google search value
    longitude_of_hong_kong = 114.1694 #google search value

    expect(@antipode.opp_lat).to be_within(0.0001).of(latitude_of_hong_kong)
    expect(@antipode.opp_long).to be_within(0.0001).of(longitude_of_hong_kong)
  end

  it 'has a latitude and longitude of itself' do

    lat_of_antipode_in_arg = -22.350627
    long_of_antipode_in_arg = -65.815084
    expect(@antipode.latitude).to be_within(0.1).of(lat_of_antipode_in_arg)
    expect(@antipode.longitude).to be_within(0.1).of(long_of_antipode_in_arg)
  end

  it 'has a location_name' do
    expect(@antipode.location_name).to include("Jujuy")
  end

  it 'has a forecast' do
    expect(@antipode.forecast).to have_key(:summary)
    expect(@antipode.forecast).to have_key(:current_temperature)
  end

  it 'has a search_location' do
    expect(@antipode.search_location).to eq("Hong Kong")
  end

  it 'has a service of AmypodeService' do
    expect(@antipode.amypode_service).to be_a(AmypodeService)
  end

end
