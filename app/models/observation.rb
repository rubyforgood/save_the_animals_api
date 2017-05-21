class Observation < ApplicationRecord
  belongs_to :observation_session

  comma do
    id "id"
    observation_session_id 'observation_session_id'
    observation_session :user_id => 'user_id'
    observation_session 'user_email' do |os| os.user&.email end
    details ('subject') { |d| d['subject'] }
    details ('modifier') { |d| d['modifier'] }
    details ('behavior') { |d| d['behavior'] }
    details ('target') { |d| d['target'] }
    created_at 'uploaded_at'
  end
end
