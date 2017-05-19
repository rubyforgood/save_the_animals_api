module Api
  class Api::ObservationSessionsController < BaseController
    def create
      observation_session = ObservationSession.new(
        user_id: current_user.id,
        observations: params.fetch('observation_session', {}).fetch('observations', nil)
      )
      observation_session.id = observation_session.observations.first['observation_session_id']
      render json: { count: observation_session.observations.count }
    end
  end
end
