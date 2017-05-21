class ObservationExportsController < ApplicationController
  def index
    @observations = Observation.all
    respond_to do |format|
      format.csv { render :csv => @observations }
    end
  end
end
