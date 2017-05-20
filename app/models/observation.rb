class Observation < ApplicationRecord
  belongs_to :observation_session

  comma do
    id "id"
    observation_session_id 'observation_session_id'
    observation_session :user_id => 'user_id'
    observation_session 'user_email' do |os| os.user&.email end
    details 'subject' do |d| d['subject'] end
    details 'modifier' do |d| d['modifier'] end
    details 'behavior' do |d| d['behavior'] end
    details 'target' do |d| d['target'] end
    created_at 'uploaded_at'
  end
end
