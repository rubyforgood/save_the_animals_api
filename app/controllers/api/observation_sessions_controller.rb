module Api
  class ObservationSessionsController < BaseController
    def create
      ActiveRecord::Base.transaction do
        create_observation_sessions
        # TODO: upsert?
        observations = observations_params.map do |observation|
          Observation.find_or_create_by(id: observation['id']) do |record|
            record.details = observation
            record.observation_session_id = observation['observation_session_id']
          end
        end

        response = observations.map { |o| { id: o.id, persisted: o.persisted?, errors: o.errors.full_messages } }
        render json: response, status: :ok
      end
    rescue ActiveRecord::StatementInvalid => e
      render json: { msg: e.message }, status: 422
    end

    private

    def create_observation_sessions
      observations_params
        .map { |o| o['observation_session_id'] }
        .uniq
        .map { |id| { id: id, user_id: current_user.id } }
        .map do |attrs|
        ObservationSession.create_once(attrs)
      end
    end

    def observations_params
      params.fetch('observations', [])
    end
  end
end
