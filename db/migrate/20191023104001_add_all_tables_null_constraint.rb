class AddAllTablesNullConstraint < ActiveRecord::Migration[5.2]
  def change
    change_column_null(:users, :name, false)
    change_column_null(:tests, :name, false)
    change_column_null(:questions, :text, false)
    change_column_null(:questions, :test_id, false)
    change_column_null(:categories, :name, false)
    change_column_null(:answers, :text, false)
    change_column_null(:answers, :question_id, false)
  end
end
