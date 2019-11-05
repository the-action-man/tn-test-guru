class Test < ApplicationRecord
  EASY_LEVEL = 0..1
  MIDDLE_LEVEL = 2..4
  UPPER_LEVEL = 5..Float::INFINITY

  belongs_to :category, optional: true
  belongs_to :author, class_name: "User"
  has_many :questions, dependent: :destroy
  has_many :tests_users, dependent: :destroy
  has_many :users, through: :tests_users

  validates :title, presence: true, \
                    uniqueness: { scope: :level, \
                                  message: "should present one per level" }
  validates :level, numericality: { only_integer: true, greater_than: 0 }

  scope :easy_level, -> { where(level: EASY_LEVEL) }
  scope :middle_level, -> { where(level: MIDDLE_LEVEL) }
  scope :upper_level, -> { where(level: UPPER_LEVEL) }
  scope :titles_by_category, \
        (lambda do |category|
          select(:title)
            .joins(:category)
            .where(categories: { title: category })
            .order(title: :desc)
        end)
end
