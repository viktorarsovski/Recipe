require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users' do
    it "creates a User and redirects to the User's page" do
      get '/users/new'
      post_params = {
        params: {
          user: {
            name: 'Viktor Arsovski',
            username: 'viktor_arso',
            email: 'test@test.com',
            password: '123123',
            password_confirmation: '123123'
          }
        }
      }
      post '/users', post_params
      expect(session[:user_id]).not_to be_nil
      follow_redirect!
      expect(response.body).to include('Viktor Arsovski')
      expect(response.body).to include('viktor_arso')
      expect(response.body).to include('test@test.com')
    end
  end

  it 'renders New when User params are empty' do
    get '/users/new'
    post_params = {
      params: {
        user: {
          name: '',
          username: '',
          email: '',
          password: '',
          password_confirmation: ''
        }
      }
    }
    post '/users', post_params
    expect(session[:user_id]).to be_nil
    expect(response.body).to include('Registration')
  end
end
