class User < ApplicationRecord
  has_many :tests_users, dependent: :destroy
  has_many :tests, through: :tests_users
  has_many :creations, class_name: "Test", foreign_key: "author_id", dependent: :destroy

  validates :email, presence: true

  def tests_with_level(level)
    tests.with_level(level)
  end
end
