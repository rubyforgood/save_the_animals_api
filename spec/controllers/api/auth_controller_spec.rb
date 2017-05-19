require 'rails_helper'

RSpec.describe Api::AuthController, type: :controller do
  describe 'POST #create' do
    let!(:user) do
      User.create!(email: 'ruby@forgood.com',
                   password: 'password',
                   password_confirmation: 'password')
    end
    context 'successful' do
      it 'returns jwt token' do
        post :create, params: { email: user.email, password: 'password' }
        expect(response).to have_http_status(:success)
        expect(JSON.parse(response.body)).to include('jwt_token')
      end
    end
    context 'invalid' do
      it 'returns jwt token' do
        post :create, params: { email: user.email, password: 'bad' }
        expect(response).to have_http_status(:unauthorized)
        expect(JSON.parse(response.body)).to eq('msg' => 'You are not authorized')
      end
    end
  end
end
