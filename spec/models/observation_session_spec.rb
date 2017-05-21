require 'rails_helper'

RSpec.describe ObservationSession, type: :model do
  describe 'validations' do
    it 'requires at least one observation' do
      user = User.create(
        email: 'user@localhost',
        password: 'password'
      )
      os1 = ObservationSession.new(user: user)
      os1.observations << Observation.new
      expect(os1.valid?).to eq(true)
    end
  end
end
