require 'rails_helper'

RSpec.describe 'User can create an account', type: :request do
  context 'in a post request with an email, password and password_confirmation' do
    it 'creates an account and sends back an api key ' do

      post '/api/v1/users',     params: {
                                          email: "whatever@example.com",
                                          password: "password",
                                          password_confirmation: "password"
                                        }
      expect(response).to be_successful
      expect(response.status).to eq(201)

      info = JSON.parse(response.body, symbolize_names: true)
      expect(info[:api_key]).to be_a(String)
      expect(User.count).to eq(1)
      expect(User.last.email).to eq("whatever@example.com")
    end

    it 'does not create an account if the password and password_confirmatin do not match' do
      post '/api/v1/users',     params: {
                                          email: "whatever@example.com",
                                          password: "password",
                                          password_confirmation: "123password"
                                        }
      expect(response).to_not be_successful
      expect(response.status).to eq(400)

      info = JSON.parse(response.body)

      expect(info["errors"]).to eq("Password confirmation doesn't match Password")
      expect(User.count).to eq(0)
    end

    it 'does not create an account if the email has been taken' do
      post '/api/v1/users',     params: {
                                          email: "whatever@example.com",
                                          password: "password",
                                          password_confirmation: "password"
                                        }
      expect(User.count).to eq(1)
      expect(User.last.email).to eq("whatever@example.com")

      post '/api/v1/users',     params: {
                                          email: "whatever@example.com",
                                          password: "1234",
                                          password_confirmation: "1234"
                                        }
      expect(response.status).to eq(400)
      info = JSON.parse(response.body)

      expect(info["errors"]).to eq("Email has already been taken")
    end
  end

end
