class RenameTeamsToMemberships < ActiveRecord::Migration[6.1]
  def change
    rename_table :teams, :memberships
  end
end
