class AddColumnToDreamsCategories < ActiveRecord::Migration[6.1]
  def change
    add_reference :dreams_categories, :dream, null: false, foreign_key: true
  end
end
