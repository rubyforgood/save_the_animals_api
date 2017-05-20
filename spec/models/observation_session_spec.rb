require 'rails_helper'

RSpec.describe ObservationSession, type: :model do
  describe 'validations' do
    it 'requires at least one observation' do
      os1 = ObservationSession.new
      os1.observations << Observation.new
      expect(os1.valid?).to eq(true)
      os2 = ObservationSession.new
      expect(os2.valid?).to eq(false)
    end
  end
end
