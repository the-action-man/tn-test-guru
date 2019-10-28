class AddTestsRefToCategory < ActiveRecord::Migration[5.2]
  def change
    add_reference :tests, :category, foreign_key: true
    change_column_null(:tests, :category_id, false)
  end
end
