class AddAnswersValidDefault < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:answers, :valid, from: nil, to: false)
  end
end
