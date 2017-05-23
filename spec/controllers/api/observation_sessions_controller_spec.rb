require 'rails_helper'

RSpec.describe Api::ObservationSessionsController, type: :controller do
  context 'authenticated' do
    login_api_user

    describe 'POST #create' do
      it 'returns http success for good data' do
        uuid = SecureRandom.uuid
        json_params = {
          "sent_at": "2017-05-20T01:15:09.728Z",
          "observations": [
            {
              "id": SecureRandom.uuid,
              "observation_session_id": uuid,
              "timestamp": "2017-05-19T01:15:09.728Z",
              "subject": "Minerva",
              "behavior": "walking",
              "modifier": "quickly"
            },
            {
              "id": SecureRandom.uuid,
              "observation_session_id": uuid,
              "timestamp": "2017-05-19T01:15:09.728Z",
              "subject": "Minerva",
              "behavior": "fighting",
              "target": "Lulu"
            }
          ]
        }
        post :create, params: json_params, as: :json
        expect(response).to have_http_status(:success)
        expect(JSON.parse(response.body).map{|o| o['persisted']}).to all( be_truthy )
      end
    end
  end
end
