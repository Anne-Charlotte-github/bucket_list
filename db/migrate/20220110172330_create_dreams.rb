class CreateDreams < ActiveRecord::Migration[6.1]
  def change
    create_table :dreams do |t|
      t.references :owner, null: false, foreign_key: {to_table: :users}
      t.string :title
      t.text :description
      t.integer :nb_users_min
      t.integer :nb_users_max
      t.integer :cost
      t.boolean :is_hidden
      t.boolean :is_completed
      t.references :duration, foreign_key: true
      t.references :location, foreign_key: true
      t.references :schedule, foreign_key: true

      t.timestamps
    end
  end
end
