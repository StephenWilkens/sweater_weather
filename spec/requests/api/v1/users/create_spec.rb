require 'rails_helper'

RSpec.describe 'Users Create Action' do
  describe 'happy path' do
    it 'creates a user and issues a response' do
      body = {
               "email": "bob@gmail.com",
               "password": "abc123",
               "password_confirmation": "abc123"
             }
      headers = { 'CONTENT_TYPE' => 'application/json', 'Accept' => 'application/json' }

      post '/api/v1/users', headers: headers, params: JSON.generate(body)

      expect(response).to be_successful
      rb = JSON.parse(response.body, symbolize_names: true)

      expect(rb).to have_key(:data)
      expect(rb[:data]).to have_key(:type)
      expect(rb[:data]).to have_key(:id)
      expect(rb[:data]).to have_key(:attributes)
      expect(rb[:data][:attributes]).to have_key(:email)
      expect(rb[:data][:attributes]).to have_key(:api_key)
      expect(rb[:data][:attributes]).to_not have_key(:password)
      expect(rb[:data][:attributes]).to_not have_key(:password_confirmation)
      expect(rb[:data][:attributes]).to_not have_key(:password_digest)
    end
  end

  describe 'sad path' do
    it 'will not create a user with mismatched passwords' do
      body = {
               "email": "bob@gmail.com",
               "password": "abc123",
               "password_confirmation": "bbb123"
             }
      headers = { 'CONTENT_TYPE' => 'application/json', 'Accept' => 'application/json' }

      post '/api/v1/users', headers: headers, params: JSON.generate(body)

      expect(response).to_not be_successful
      expect(response.status).to eq(422)
    end
    it 'will not create a user with an already used email' do
      body = {
               "email": "bob@gmail.com",
               "password": "abc123",
               "password_confirmation": "abc123"
             }
      headers = { 'CONTENT_TYPE' => 'application/json', 'Accept' => 'application/json' }

      post '/api/v1/users', headers: headers, params: JSON.generate(body)

      expect(response).to be_successful
      
      body = {
               "email": "bob@gmail.com",
               "password": "abc123",
               "password_confirmation": "abc123"
             }
      headers = { 'CONTENT_TYPE' => 'application/json', 'Accept' => 'application/json' }

      post '/api/v1/users', headers: headers, params: JSON.generate(body)

      expect(response).to_not be_successful
      expect(response.status).to eq(422)
    end
  end
end