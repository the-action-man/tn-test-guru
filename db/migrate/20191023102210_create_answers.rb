class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.string :text
      t.integer :question_id
      t.boolean :valid

      t.timestamps
    end
  end
end
