class MoveObservations < ActiveRecord::Migration[5.1]
  def change
    remove_column :observation_sessions, :observations
    create_table :observations, id: :uuid do |t|
      t.integer :observation_session_id
      t.jsonb :details
      t.timestamps
    end
  end
end
