class HomeController < ApplicationController
  def index
    @num_observations = Observation.count
    @latest_observation = Observation.latest
  end
end
