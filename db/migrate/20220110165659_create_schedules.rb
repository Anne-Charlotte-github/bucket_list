class CreateSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :schedules do |t|
      t.datetime :start_at
      t.datetime :end_at
      t.boolean :is_confirmed

      t.timestamps
    end
  end
end
