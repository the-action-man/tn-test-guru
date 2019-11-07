class RenameNameToEmailInUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :name, :email
    rename_column :answers, :text, :body
    rename_column :categories, :name, :title
    rename_column :questions, :text, :body
    rename_column :tests, :name, :title
  end
end
