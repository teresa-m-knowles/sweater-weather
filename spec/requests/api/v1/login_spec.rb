require 'rails_helper'

RSpec.describe 'User can login' do
  context 'in a post request to /api/v1/sessions with their email and password' do
    it 'can login a user and send them their api_key' do
      post '/api/v1/users',     params: {
                                          email: "whatever@example.com",
                                          password: "password",
                                          password_confirmation: "123password"
                                        }
      user = User.last

      post '/api/v1/sessions', params: {
                                          email: "whatever@example.com",
                                          password: "password"
                                        }
      expect(response.status).to eq(200)
      info = JSON.parse(response.body, symbolize_names: true)
      expect(info).to have_key(:api_key)
      expect(info[:api_key]).to eq(user.api_key)
    end
  end
end
