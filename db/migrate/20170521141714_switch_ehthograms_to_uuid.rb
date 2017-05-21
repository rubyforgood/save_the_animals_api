class SwitchEhthogramsToUuid < ActiveRecord::Migration[5.1]
  def change
    drop_table :ethogram_structures
    drop_table :ethograms

    create_table :ethograms, id: :uuid do |t|
      t.string :name

      t.timestamps
    end

    create_table :ethogram_structures, id: :uuid do |t|
      t.uuid :ethogram_id
      t.jsonb :structure

      t.timestamps
    end
  end
end
