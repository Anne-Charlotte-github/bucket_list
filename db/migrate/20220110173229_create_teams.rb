class CreateTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :teams do |t|
      t.references :user, null: false, foreign_key: true
      t.references :dream, null: false, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
