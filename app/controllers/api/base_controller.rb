module Api
  class BaseController < ActionController::Base
    before_action :authenticate!
    def authenticate!
    end

    def unauthorized
      render json: { msg: 'You are not authorized' }, status: :unauthorized
    end

    def current_user
      # binding.pry
      # @_current_user ||= User.find_by(id: id)
    end
    helper_method :current_user
  end
end
