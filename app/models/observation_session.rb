class ObservationSession < ApplicationRecord
  has_many :observations
  belongs_to :user

  def self.create_once(attrs)
    create!(attrs)
  rescue ActiveRecord::StatementInvalid => e
    raise e unless e.message.includes('DuplicateKey')
    find(attrs['id'])
  end
end
