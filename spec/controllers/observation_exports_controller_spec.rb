require 'rails_helper'

RSpec.describe ObservationExportsController, type: :controller do
  describe 'GET #index with a valid user' do
    login_user
    it 'returns http success and csv data' do
      user = User.new(
        email: 'user@localhost',
        password: 'password'
      )
      os = ObservationSession.create( user: user )
      os.observations << Observation.create(
        id: SecureRandom.uuid,
        details: {
          subject: 'Carl',
          modifier: 'calmly',
          behavior: 'collects',
          target: 'cephalopods',
        },
        created_at: '2017-05-20 12:34:56 UTC',
        updated_at: '2017-05-20 12:34:56 UTC',
      )

      get :index, format: :csv
      expect(response).to have_http_status(:success)

      expect(assigns(:observations)).to eq(Observation.all)
      header,data = response.body.split(/\n/)
      expect(header).to eq('id,observation_session_id,user_id,user_email,subject,modifier,behavior,target,uploaded_at')
      expect(data).to eq(Observation.first.to_comma.join(','))
      expect(data).to match(/,user@localhost,Carl,calmly,collects,cephalopods,2017-05-20 12:34:56 UTC/)
    end
  end

  describe 'GET #index without signing in' do
    it 'returns http Unauthorized' do
      get :index, format: :csv
      expect(response).to have_http_status(:unauthorized)
    end
  end
end
