require 'rails_helper'

RSpec.describe ObservationExportsController, type: :controller do
  describe 'GET #index with a valid user' do
    login_user

    it 'returns http success and csv data' do
      user = create(:user)
      os = ObservationSession.create( user: user )
      os.observations << Observation.create(
        id: SecureRandom.uuid,
        details: {
          subject: 'Carl',
          modifier: 'calmly',
          behavior: 'collects',
          target: 'cephalopods',
          timestamp: '2017-05-20 12:34:56 UTC',
        },
        created_at: '2017-05-20 12:34:56 UTC',
        updated_at: '2017-05-20 12:34:56 UTC',
      )

      get :index, format: :csv
      expect(response).to have_http_status(:success)

      expect(assigns(:observations)).to eq(Observation.all)
      header,data = response.body.split(/\n/)

      expect(header).to eq('id,observation_session_id,user_id,user_email,subject,modifier,behavior,target,timestamp')
      expect(data).to eq(Observation.first.to_comma.join(','))

      data_regex = Regexp.new(Regexp.escape(user.email), ',Carl,calmly,collects,cephalopods,2017-05-20 12:34:56 UTC')
      expect(data).to match(data_regex)
    end
  end

  describe 'GET #index without signing in' do
    it 'returns http Unauthorized' do
      get :index, format: :csv

      expect(response).to have_http_status(:unauthorized)
    end
  end
end
