class Answer < ApplicationRecord
  MAX_ANSWERS_QUANTITY = 4

  belongs_to :question

  validates :body, presence: true
  validate :validate_answers_per_question, on: :create

  scope :correct_answer, -> { where(correct: true) }

  private

  def validate_answers_per_question
    answers_quantity = question.answers.count
    return if answers_quantity >= MAX_ANSWERS_QUANTITY

    errors.add(:answers,
               "can't be more then #{MAX_ANSWERS_QUANTITY} per question")
  end
end
