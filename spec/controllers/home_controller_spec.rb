require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe 'GET #index' do
    login_user

    it 'assigns expected instance variables' do
      get :index

      expect(assigns(:num_observations)).to eq Observation.count
      expect(assigns(:latest_observation)).to eq Observation.latest
    end
  end
end
