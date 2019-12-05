class User < ApplicationRecord
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :creations, class_name: "Test", foreign_key: "author_id", dependent: :destroy

  validates :email, presence: true

  def tests_with_level(level)
    tests.with_level(level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
