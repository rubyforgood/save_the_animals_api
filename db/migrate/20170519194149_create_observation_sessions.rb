class CreateObservationSessions < ActiveRecord::Migration[5.1]
  def change
    enable_extension "pgcrypto"
    create_table :observation_sessions, id: :uuid do |t|
      t.integer :user_id
      t.decimal :longitude
      t.decimal :latitude
      t.timestamps
      t.jsonb :observations
    end
  end
end
