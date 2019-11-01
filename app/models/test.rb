class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: "User"
  has_many :questions
  has_many :tests_users
  has_many :users, through: :tests_users

  def self.by_category(category)
    joins(:category)
      .where(categories: { name: category })
      .order(name: :desc)
      .pluck(:name)
  end
end
