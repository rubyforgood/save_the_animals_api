# frozen_string_literal: true

module Api
  class EthogramsController < BaseController
    def index
      render json: { data: Ethogram.all.as_json(
        only: %i[id name],
        methods: %i[subjects behaviors structure_id]
      ) }
    end
  end
end
