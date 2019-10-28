class RemoveUserFromTests < ActiveRecord::Migration[5.2]
  def change
    remove_column :tests, :user_id, :integer
  end
end
