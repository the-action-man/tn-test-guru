class AllowNullInCategoryIdOfTests < ActiveRecord::Migration[5.2]
  def change
    change_column_null(:tests, :category_id, true)
  end
end
