class AddColumnToImages < ActiveRecord::Migration[6.1]
  def change
    add_reference :images, :dream, null: false, foreign_key: true
  end
end
