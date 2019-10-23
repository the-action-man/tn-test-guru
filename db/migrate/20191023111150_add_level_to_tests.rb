class AddLevelToTests < ActiveRecord::Migration[5.2]
  def change
    add_column :tests, :level, :integer
    change_column_default(:tests, :level, 0)
  end
end
