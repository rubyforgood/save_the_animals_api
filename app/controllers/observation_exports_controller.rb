class ObservationExportsController < ApplicationController
  before_action :authenticate_user!

  def index
    @observations = Observation.all
    respond_to do |format|
      format.csv { render :csv => @observations }
    end
  end
end
