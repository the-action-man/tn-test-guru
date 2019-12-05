class RenameTestsUsersToTestPassages < ActiveRecord::Migration[5.2]
  def change
    rename_table :tests_users, :test_passages
  end
end
