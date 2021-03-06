require 'rails_helper'

RSpec.describe 'A user can see a list of their favorite locations' do
  before :each do
    @user = User.create!(email: "whatever@example.com",
                       password: "password",
                       password_confirmation: "password",
                       api_key: SecureRandom.urlsafe_base64
                       )
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
  end

  context 'with a delete request to /api/v1/favorites' do
    it 'deletes the sent location off the user/s favorites' do
      delete '/api/v1/favorites', params: {
                                           "location": "Denver, CO",
                                           "api_key": "#{@user.api_key}"
                                         }

      expect(@user.favorites.count).to eq(1)

      @user.locations.each do |location|
        expect(location.city_and_state).to_not include("Denver")
      end



      info = JSON.parse(response.body, symbolize_names: true)

      expect(info[:data].count).to eq(1)
      expect(info[:data][0][:attributes][:locations][:location]).to include("New York")
    end
  end
end
