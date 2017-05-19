require 'rails_helper'

RSpec.describe Api::EthogramsController, type: :controller do
  context 'authenticated' do
    login_api_user

    describe 'GET #index' do
      it 'returns http success' do
        get :index
        expect(response).to have_http_status(:success)
      end
    end
  end
end
