require 'rails_helper'

RSpec.describe 'Antipode for a given city' do
  context 'in a get request like api/v1/antipode?loc=hongkong' do
    it 'returns the antipode for the city' do
      get '/api/v1/antipode?loc=hongkong'
      expect(response).to be_successful
      binding.pry
    end
  end
end
