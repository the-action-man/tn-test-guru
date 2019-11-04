class User < ApplicationRecord
  has_many :tests_users, dependent: :destroy
  has_many :tests, through: :tests_users
  has_many :creations, class_name: "Test", foreign_key: "author_id", dependent: :destroy

  validates :email, presence: true

  scope :tests_with_level, ->(user_id, level) { Test.joins(:users).where(users: { id: user_id }, tests: { level: level }) }
end
