class CreateDurations < ActiveRecord::Migration[6.1]
  def change
    create_table :durations do |t|
      t.integer :quantity
      t.string :unit
      t.integer :nb_minutes

      t.timestamps
    end
  end
end
