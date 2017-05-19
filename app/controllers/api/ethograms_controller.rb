module Api
  class EthogramsController < BaseController
    def index
      render json: {
        subjects: ['Miles', 'Lulu', 'Minerva'],
        behaviors: [
          { name: 'walking', modifiers: ['quickly', 'slowly'], has_target: false },
          { name: 'fighting', modifiers: [], has_target: true }
        ]
      }
    end
  end
end
