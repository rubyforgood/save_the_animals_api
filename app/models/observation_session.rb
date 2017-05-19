class ObservationSession < ApplicationRecord
  validates :observations, presence: true
end
