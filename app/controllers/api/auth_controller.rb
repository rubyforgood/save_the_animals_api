module Api
  class AuthController < BaseController
    skip_before_action :authenticate!

    def create
      user = current_user || User.authenticate(params[:email], params[:password])
      if user
        render json: { jwt_token: user.token }
      else
        unauthorized
      end
    end
  end
end
