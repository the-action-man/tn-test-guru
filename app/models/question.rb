class Question < ApplicationRecord
  belongs_to :test
  has_many :answers, dependent: :destroy
  has_many :test_passages

  validates :body, presence: true

  def number
    test.questions.to_a.index(self) + 1
  end
end
