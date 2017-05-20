class CreateEthograms < ActiveRecord::Migration[5.1]
  def change
    create_table :ethograms do |t|
      t.string :name

      t.timestamps
    end
  end
end
