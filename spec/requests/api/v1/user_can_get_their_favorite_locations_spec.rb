require 'rails_helper'

RSpec.describe 'A user can see a list of their favorite locations' do
  before :each do
    @user = User.create!(email: "whatever@example.com",
                       password: "password",
                       password_confirmation: "password",
                       api_key: SecureRandom.urlsafe_base64
                       )
  end

  context 'in a get request to /api/v1/favorites' do
    it 'returns a list of their favorite locations and their current weather' do
      post '/api/v1/favorites', params: {
                                          "location": "Denver, CO",
                                          "api_key": "#{@user.api_key}"
                                        }

      expect(@user.favorites.count).to eq(1)

      post '/api/v1/favorites', params: {
                                          "location": "new york city, ny",
                                          "api_key": "#{@user.api_key}"
                                        }

      expect(@user.favorites.count).to eq(2)

      get '/api/v1/favorites', params: { "api_key": "#{@user.api_key}"}
      
      binding.pry




    end
  end
end
