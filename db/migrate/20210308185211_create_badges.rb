class CreateBadges < ActiveRecord::Migration[5.2]
  def change
    create_table :badges do |t|
      t.string :name, null: false
      t.string :url, null: false
      t.integer :rule_type, null: false
      t.string :rule_value, null: false

      t.timestamps
    end

    create_table :user_badges do |t|
      t.belongs_to :user, foreign_key: true, null: false
      t.belongs_to :badge, foreign_key: true, null: false
      t.integer :quantity, default: 1, null: false

      t.timestamps
    end
  end
end
