class ObservationSession < ApplicationRecord
  has_many :observations
  belongs_to :user

  def self.create_once(attrs)
    find_or_create_by!(attrs)
  end
end
