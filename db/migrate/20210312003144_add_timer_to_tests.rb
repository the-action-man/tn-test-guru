class AddTimerToTests < ActiveRecord::Migration[5.2]
  def change
    add_column :tests, :timer, :integer, default: 1, null: false
  end
end
