require 'rails_helper'

RSpec.describe Api::ObservationSessionsController, type: :controller do
  context 'authenticated' do
    login_api_user

    describe 'POST #create' do
      it 'returns http success' do
        json_params = {
          "observation_session": {
            "observations": [
              {
                "id": "uuid-goes-here",
                "timestamp": "2017-05-19T01:15:09.728Z",
                "subject": "Minerva",
                "behavior": "walking",
                "modifier": "quickly"
              },
              {
                "id": "other-uuid-goes-here",
                "timestamp": "2017-05-19T01:15:09.728Z",
                "subject": "Minerva",
                "behavior": "fighting",
                "target": "Lulu"
              }
            ]
          }
        }
        post :create, params: json_params, as: :json
        expect(response).to have_http_status(:success)
        expect(JSON.parse(response.body)).to eq('count' => 2)
      end
    end
  end
end
