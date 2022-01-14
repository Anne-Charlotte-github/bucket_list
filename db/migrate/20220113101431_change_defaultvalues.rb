class ChangeDefaultvalues < ActiveRecord::Migration[6.1]
  def change
    change_column_default :dreams, :is_hidden, from: nil, to: true
    change_column_default :schedules, :is_confirmed, from: nil, to: false
    change_column_default :friendships, :is_confirmed, from: nil, to: false
  end
end
