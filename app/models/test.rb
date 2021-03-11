class Test < ApplicationRecord
  MINIMAL_LEVEL = 1
  EASY_LEVEL = 0..1
  MIDDLE_LEVEL = 2..4
  UPPER_LEVEL = 5..Float::INFINITY

  belongs_to :category, optional: true
  belongs_to :author, class_name: "User"
  has_many :questions, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages

  validates :title, presence: true, uniqueness: { scope: :level,
                                                  message: "should present one per level" }
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: MINIMAL_LEVEL }
  validates :category, presence: true

  scope :with_level, ->(level) { where(level: level) }
  scope :easy_level, -> { with_level(EASY_LEVEL) }
  scope :middle_level, -> { with_level(MIDDLE_LEVEL) }
  scope :upper_level, -> { with_level(UPPER_LEVEL) }
  scope :titles_by_category,
        (lambda do |category|
          select(:title)
            .joins(:category)
            .where(categories: { title: category })
            .order(title: :desc)
        end)
  scope :ids_by_category,
        (lambda do |category|
          select(:id)
              .joins(:category)
              .where(categories: { title: category })
              .order(title: :desc)
        end)
end
