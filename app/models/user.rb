class User < ApplicationRecord
  def tests_with_level(level)
    Test.joins('INNER JOIN results on results.test_id = tests.id')
        .where(tests: { level: level }, results: { user_id: id })
  end
end
