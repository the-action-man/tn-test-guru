class AddAnswersValidDefault < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:answers, :valid, false)
  end
end
