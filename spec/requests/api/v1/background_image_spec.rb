require 'rails_helper'

RSpec.describe 'Background image endpoint' do
  context 'when I make a get request to /api/v1/backgrounds?location=denver,co' do
    it 'returns an image of the location' do
      get '/api/v1/backgrounds?location=denver,co'
      data = JSON.parse(response.body, symbolize_names: true)[:data]
      expect(response).to be_successful
      expect(data[:attributes]).to have_key(:image_url)
      expect(data[:attributes][:image_url]).to be_a(String)
    end
  end
end
