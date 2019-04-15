require 'rails_helper'

RSpec.describe 'User can favorite a location', type: :request do
  before :each do
    @user = User.create!(email: "whatever@example.com",
                       password: "password",
                       password_confirmation: "password",
                       api_key: SecureRandom.urlsafe_base64
                       )
  end
  context 'when a user sends in a location and a valid api_key' do
    it 'saves that location to its favorites' do

      post '/api/v1/favorites', params: {
                                          "location": "Denver, CO",
                                          "api_key": "#{@user.api_key}"
                                        }

      expect(@user.favorites.count).to eq(1)
      expect(@user.favorites.first.location).to be_a(Location)
      expect(@user.favorites.first.location.city_and_state).to eq("Denver, CO")

    end
  end

  context 'when a user sends in a location that is already in their favorites' do
    it 'does not save in their favorites again' do
      post '/api/v1/favorites', params: {
                                          "location": "Denver, CO",
                                          "api_key": "#{@user.api_key}"
                                        }
      expect(@user.favorites.count).to eq(1)

      post '/api/v1/favorites', params: {
                                          "location": "denver,colorado", 
                                          "api_key": "#{@user.api_key}"
                                        }
      expect(response.status).to eq(400)
      info = JSON.parse(response.body, symbolize_names: true)
      expect(info).to have_key(:errors)
      expect(info[:errors]).to eq("That location is already in your favorites")

      expect(@user.favorites.count).to eq(1)

    end
  end
end
