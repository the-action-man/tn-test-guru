class User < ApplicationRecord
  has_many :tests_users
  has_many :tests, through: :tests_users
  has_many :creations, class_name: "Test", foreign_key: "author_id"

  def tests_with_level(level)
    Test.joins('INNER JOIN results on results.test_id = tests.id')
        .where(tests: { level: level }, results: { user_id: id })
  end
end
