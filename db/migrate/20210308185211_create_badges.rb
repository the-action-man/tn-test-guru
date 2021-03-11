class CreateBadges < ActiveRecord::Migration[5.2]
  def change
    create_table :rules do |t|
      t.string :name, null: false

      t.timestamps
    end

    add_index :rules, :name, unique: true

    create_table :badges do |t|
      t.string :name, null: false
      t.string :url, null: false
      t.integer :rule_id, null: false

      t.timestamps
    end

    create_table :user_badges do |t|
      t.belongs_to :user, foreign_key: true, null: false
      t.belongs_to :badge, foreign_key: true, null: false
      t.integer :count, default: 1, null: false

      t.timestamps
    end
  end
end
