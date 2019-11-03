class RenameResultsToTestsUsers < ActiveRecord::Migration[5.2]
  def change
    rename_table :results, :tests_users
  end
end
