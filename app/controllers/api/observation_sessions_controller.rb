module Api
  class ObservationSessionsController < BaseController
    def create
      ActiveRecord::Base.transaction do
        create_observation_sessions
        # TODO: upsert?
        puts observations_params.inspect
        # observations = observations_params.map do |observation|
        #   observation_session = ObservationSession.find_by(id: observation['observation_session_id'])
        #   Observation.find_or_create_by(id: observation['id']) do |record|
        #     record.details = observation
        #     record.observation_session = observation_session
        #     record.save
        #   end
        # end

        observations = []
        session_ids_to_instances =  observations_params
          .map {|param| param['observation_session_id']}
          .uniq
          .map { |session_id| ObservationSession.find_or_create_by(id: session_id) }
          .group_by { |session| session.id }
        
 
        observations_params.each do | observation |
          Observation.find_or_create_by(id: observation['id']) do |record|
            record.details = observation
            record.observation_session = session_ids_to_instances[observation['observation_session_id']][0]
            record.save
            observations << record
          end
        end
        
        response = observations.map { |o| { id: o.id, persisted: o.persisted?, errors: o.errors.full_messages } }
        render json: response, status: :ok
      end
    rescue ActiveRecord::StatementInvalid => e
      render json: { msg: e.message }, status: 422
    end

    private

    # def create_observation_sessions
    #   observations_params
    #     .map { |o| o['observation_session_id'] }
    #     .uniq
    #     .map { |id| { id: id, user_id: current_user.id } }
    #     .map do |attrs|
    #     ObservationSession.create_once(attrs)
    #   end
    # end

    def create_observation_sessions
      unique_sessions = observations_params
        .map { |o| o['observation_session_id'] }
        .uniq

      selector_map = unique_sessions
        .map { |id| { id: id, user_id: current_user.id } }
      
      selector_map.each do |selector|
        ObservationSession.create_once(selector)
      end
    end

    def observations_params
      params.fetch('observations', [])
    end
  end
end
