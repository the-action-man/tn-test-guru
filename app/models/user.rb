class User < ApplicationRecord
  has_many :tests_users
  has_many :tests, through: :tests_users
  has_many :creations, class_name: "Test", foreign_key: "author_id"

  def tests_with_level(level)
    tests.where(tests: { level: level })
  end
end
