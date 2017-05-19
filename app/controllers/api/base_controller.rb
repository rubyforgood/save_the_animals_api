module Api
  class BaseController < ActionController::Base
    before_action :authenticate!
    def authenticate!
      unauthorized unless current_user
    end

    def unauthorized
      render json: { msg: 'You are not authorized' }, status: :unauthorized
    end

    def current_user
      token = request.headers['AUTHORIZATION'].to_s.split(' ').last
      if token
        payload = JWT.decode token, Rails.application.secrets.secret_key_base, true, algorithm: 'HS256'
        @_current_user ||= User.find_by(id: payload.first['id'])
      end
    end
    helper_method :current_user
  end
end
