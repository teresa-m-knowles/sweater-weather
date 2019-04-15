require 'rails_helper'

RSpec.describe Antipode do
  before :each do
    @antipode = Antipode.new(22.3193039, 114.1693611)
  end
  it 'exists and is initialized with opposite lat and long' do
    expect(@antipode).to be_a(Antipode)
  end

  it 'has a latitude and longitude of the opposite city' do
    
  end

  it 'has a location_name' do
  end
end
