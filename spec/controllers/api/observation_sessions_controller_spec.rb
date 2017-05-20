require 'rails_helper'

RSpec.describe Api::ObservationSessionsController, type: :controller do
  context 'authenticated' do
    login_api_user

    describe 'POST #create' do
      it 'returns http success for good data' do
        uuid = SecureRandom.uuid
        json_params = {
          "observation_session": {
            "observations": [
              {
                "id": "uuid-goes-here",
                "observation_session_id": uuid,
                "timestamp": "2017-05-19T01:15:09.728Z",
                "subject": "Minerva",
                "behavior": "walking",
                "modifier": "quickly"
              },
              {
                "id": "other-uuid-goes-here",
                "observation_session_id": uuid,
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
        expect(JSON.parse(response.body)).to eq('status' => 'ok', 'count' => 2)
      end

      it 'returns http status 422 for bad' do
        json_params = {
          "observation_session": {
            "observations": []
          }
        }
        post :create, params: json_params, as: :json
        expect(response).to have_http_status(422)
        expect(JSON.parse(response.body)).to eq('status' => 'error', 'errors'=>{'observations'=>["can't be blank"]})
      end
    end
  end
end
