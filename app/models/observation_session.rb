class ObservationSession < ApplicationRecord
  has_many :observations
  validates :observations, presence: true
end
