class User < ApplicationRecord
  belongs_to :test
  has_many :tests_users
  has_many :tests, through: :tests_users

  def tests_with_level(level)
    Test.joins('INNER JOIN results on results.test_id = tests.id')
        .where(tests: { level: level }, results: { user_id: id })
  end
end
