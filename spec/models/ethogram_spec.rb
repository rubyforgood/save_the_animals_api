require 'rails_helper'

RSpec.describe Ethogram, type: :model do
  let(:ethogram) do
    Ethogram.create!(
      name: 'Pandas at the Zoo',
      structure: {
        subjects: %w[
          Miles
          Lulu
          Minerva
        ],
        behaviors: [
          {
            name: 'walking',
            modifiers: %w[
              quickly
              slowly
            ],
            has_target: false
          },
          {
            name: 'fighting',
            modifiers: [],
            has_target: true
          }
        ]
      }
    )
  end

  describe '#structure' do
    it 'gives the most recent structure' do
      expect(ethogram.structure.fetch('subjects')).to include 'Miles'
    end
  end
end
