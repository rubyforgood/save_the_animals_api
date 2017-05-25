module Api
  class ObservationSessionsController < BaseController
    def create
      ActiveRecord::Base.transaction do
        
      session_ids_to_instances = {} 
      processed_observations = []   

      observations_params.each do | observation |
          session = session_ids_to_instances.fetch(observation['observation_session_id']) do | session_id |
            session_ids_to_instances[session_id] = ObservationSession.find_or_create_by(id: session_id, user_id: current_user.id)
          end
          
          Observation.find_or_create_by(id: observation['id']) do |record|
            record.details = observation
            record.observation_session = session
            record.save
            processed_observations << record
          end
        end
        
        response = processed_observations.map { |o| { id: o.id, persisted: o.persisted?, errors: o.errors.full_messages } }
        render json: response, status: :ok
      end
    rescue ActiveRecord::StatementInvalid => e
      render json: { msg: e.message }, status: 422
    end

    private

    def observations_params
      params.fetch('observations', [])
    end
  end
end
