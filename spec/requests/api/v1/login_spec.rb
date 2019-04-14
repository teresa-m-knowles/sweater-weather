require 'rails_helper'

RSpec.describe 'User can login' do
  context 'in a post request to /api/v1/sessions with their email and password' do
    it 'can login a user and send them their api_key' do
      post '/api/v1/users',     params: {
                                          email: "whatever@example.com",
                                          password: "password",
                                          password_confirmation: "password"
                                        }
      user = User.last

      post '/api/v1/sessions', params: {
                                          email: "whatever@example.com",
                                          password: "password"
                                        }

      info = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(200)

      expect(info).to have_key(:api_key)
      expect(info[:api_key]).to eq(user.api_key)
    end

    it 'does not send the api_key with bad credentials' do
      post '/api/v1/users',     params: {
                                          email: "whatever@example.com",
                                          password: "password",
                                          password_confirmation: "password"
                                        }

      post '/api/v1/sessions', params: {
                                          email: "whatever@example.com",
                                          password: "bad_password"
                                        }
      info = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(403)

      expect(info).to_not have_key(:api_key)
      expect(info[:errors]).to eq("Invalid email and/or password")
    end
  end
end
