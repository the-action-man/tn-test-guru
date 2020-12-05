class CreateGists < ActiveRecord::Migration[5.2]
  def change
    create_table :gists do |t|
      t.string :url
      t.belongs_to :user, foreign_key: true
      t.belongs_to :question, foreign_key: true

      t.timestamps
    end

    change_column_null(:gists, :url, false)
    change_column_null(:gists, :user_id, false)
    change_column_null(:gists, :question_id, false)
  end
end
