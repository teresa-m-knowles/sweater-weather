require 'rails_helper'

RSpec.describe 'Antipode for a given city' do
  context 'in a get request like api/v1/antipode?loc=hongkong' do
    it 'returns the antipode for the city' do
      get '/api/v1/antipode?loc=hongkong'
      expect(response).to be_successful
      info = JSON.parse(response.body, symbolize_names: true)

      expect(info[:data][:type]).to eq("antipode")
      expect(info[:data][:attributes]).to have_key(:forecast)
      expect(info[:data][:attributes][:forecast]).to have_key(:summary)
      expect(info[:data][:attributes][:forecast]).to have_key(:current_temperature)
      expect(info[:data][:meta][:search_location]).to eq("Hong Kong")
    end

  end
end
