class CreateEthogramStructures < ActiveRecord::Migration[5.1]
  def change
    create_table :ethogram_structures do |t|
      t.references :ethogram, foreign_key: true
      t.jsonb :structure

      t.timestamps
    end
  end
end
