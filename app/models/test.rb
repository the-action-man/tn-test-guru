class Test < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :author, class_name: "User"
  has_many :questions, dependent: :destroy
  has_many :tests_users, dependent: :destroy
  has_many :users, through: :tests_users

  validates :title, presence: true, \
                    uniqueness: { scope: :level, \
                                  message: "should present one per level" }
  validates :level, numericality: { only_integer: true, greater_than: 0 }

  def self.by_category(category)
    joins(:category)
      .where(categories: { title: category })
      .order(title: :desc)
      .pluck(:title)
  end
end
