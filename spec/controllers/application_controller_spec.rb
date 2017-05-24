require 'rails_helper'

RSpec.describe ApplicationController, :type => :controller do
  controller do
    def index
      render :plain => 'Success'
    end
  end

  describe 'without signing in' do
    it 'redirects to the sign in page' do
      get :index

      expect(response).to redirect_to new_user_session_path
    end
  end

  describe 'after signing in' do
    login_user

    it 'processes request' do
      get :index

      expect(response).to have_http_status(200)
      expect(response.body).to eq 'Success'
    end
  end
end
