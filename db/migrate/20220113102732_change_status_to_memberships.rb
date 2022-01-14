class ChangeStatusToMemberships < ActiveRecord::Migration[6.1]
  def change
    remove_column :memberships, :status
    add_column :memberships, :is_confirmed, :boolean, default: false
  end
end
