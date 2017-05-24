class UsersController < ApplicationController
  # GET /users
  def index
    @users = User.where.not(id: current_user.id)
  end

  # DELETE /users/1
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to users_url, notice: t('notices.destroy', model_name: @user.email)
  end
end
