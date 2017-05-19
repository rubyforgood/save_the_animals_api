module Api
  class EthogramsController < BaseController
    def index
      render json: Ethogram.all.as_json(only: %i[id name], methods: %i[structure structure_id])
    end
  end
end
