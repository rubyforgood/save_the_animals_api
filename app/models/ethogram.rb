class Ethogram < ApplicationRecord
  validates_presence_of :name
  has_many :ethogram_structures

  def current_ethogram_structure
    ethogram_structures.order(:created_at).last
  end

  delegate :structure, to: :current_ethogram_structure, allow_nil: true

  def structure_id
    current_ethogram_structure&.id
  end

  def structure=(form)
    form = JSON.parse(form) if form.is_a?(String)
    ethogram_structures.build(structure: form)
  end
end
