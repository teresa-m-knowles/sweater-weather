require 'rails_helper'

RSpec.describe "Forecast for a city API" do
  it 'can get the weather forecast' do
    get '/api/v1/forecast?location=denver,co'
    expect(response).to be_successful
    binding.pry
  end
end
