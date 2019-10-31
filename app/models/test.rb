class Test < ApplicationRecord
  has_many :questions
  belongs_to :category
  has_many :tests_users
  has_many :users, through: :tests_users
  belongs_to :author, class_name: "User"

  def self.by_category(category)
    joins('INNER JOIN categories ON tests.category_id = categories.id')
      .where(categories: { name: category })
      .order(name: :desc)
      .pluck(:name)
  end
end
