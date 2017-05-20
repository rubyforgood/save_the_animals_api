module Api
  class Api::ObservationSessionsController < BaseController
    def create
      observation_session = ObservationSession.find_or_initialize_by(
        id: get_session_uuid(params),
        user_id: current_user.id,
      )
      params.fetch('observation_session')&.fetch('observations').each do |observation|
        if observation_session.id == observation['observation_session_id']
          # TODO Verify the Observation UUID does not exist yet
          observation_session.observations.new(
            details: observation
          )
        else
          # TODO This Observation has a different parent (ObservationSession) uuid. How should this be handled?
        end
      end

      if observation_session.save
        result = { status: :ok, count: observation_session.observations.count }
        status = 201
      else
        result = { status: :error, errors: observation_session.errors.messages }
        status = 422
      end
      render json: result, status: status
    end

    private

    def get_session_uuid(input)
      input.fetch('observation_session')&.fetch('observations')&.first&.fetch('observation_session_id',nil)
    end
  end
end
