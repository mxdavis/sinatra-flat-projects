require 'spec_helper'

describe UsersController do

  describe 'signup' do
    before(:each) do
      get '/signup'

      @params = {
        first_name: 'Cernan',
        last_name: 'Bernardo',
        email: 'cernan@flatironschool.com',
        username: 'cernanb',
        password: 'password'
      }
    end

    it 'loads the signup page' do
      expect(last_response.status).to eq(200)
    end

    it 'creates a new user' do
      post '/users', @params
      expect(last_response.location).to include("/projects")
    end

    it 'does not let the user sign up without a username' do
      @params[:username] = nil
      post '/users', @params
      expect(last_response.location).to include("/signup")
    end

    it 'does not let the user sign up without an email' do
      @params[:email] = nil
      post '/users', @params
      expect(last_response.location).to include("/signup")
    end

  end





end
