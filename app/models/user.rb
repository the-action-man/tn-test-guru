class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable

  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :creations, class_name: "Test", foreign_key: "author_id", dependent: :destroy

  validates :email, presence: true,
                    uniqueness: true,
                    format: { with: /.+@.+/i }

  def tests_with_level(level)
    tests.with_level(level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
