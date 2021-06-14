class AddTimeElapsedToTestPassages < ActiveRecord::Migration[5.2]
  def change
    add_column :test_passages, :time_elapsed, :boolean, default: false, null: false
  end
end
