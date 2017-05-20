class ObservationExportsController < ApplicationController
  before_action :authenticate!
  def authenticate!
    unauthorized unless current_user
  end

  def unauthorized
    render plain: "You must sign in first.\n", status: :unauthorized
  end

  def index
    @observations = Observation.all
    respond_to do |format|
      format.csv { render :csv => @observations }
    end
  end
end
