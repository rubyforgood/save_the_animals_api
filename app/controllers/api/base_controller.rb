module Api
  class BaseController < ActionController::Base
    before_action :authenticate!
    def authenticate!

    end

    def not_authorized
      render json: {msg: 'You are not authorized'}, status: :not_authorized
    end

    def current_user
      # binding.pry
      # @_current_user ||= User.find_by(id: id)
    end
    helper_method :current_user
  end
end
