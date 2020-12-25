class CreateSupportMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :support_messages do |t|
      t.string :email
      t.string :message

      t.timestamps
    end
  end
end
