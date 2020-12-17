class AddIndexTitleLevelToTest < ActiveRecord::Migration[5.2]
  def change
    add_index :tests, %w(title level)
  end
end
