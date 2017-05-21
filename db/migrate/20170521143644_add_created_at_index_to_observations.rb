class AddCreatedAtIndexToObservations < ActiveRecord::Migration[5.1]
  def change
    add_index :observations, :created_at
  end
end
