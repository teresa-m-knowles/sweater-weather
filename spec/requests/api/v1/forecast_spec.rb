require 'rails_helper'

RSpec.describe "Forecast for a city API", type: :request do
  it 'can get the weather forecast' do
    get '/api/v1/forecast?location=denver,co'
    expect(response).to be_successful

    expect(response.content_type).to eq("application/json")
    data = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(data[:attributes][:city]).to eq("Denver")
    expect(data[:attributes][:state]).to eq("CO")
    expect(data[:attributes][:country]).to eq("United States")
    expect(data[:attributes]).to have_key(:forecast)
    expect(data[:attributes][:forecast][:currently]).to have_key(:summary)
  end
end
