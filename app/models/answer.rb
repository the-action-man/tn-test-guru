class Answer < ApplicationRecord
  MAX_ANSWERS_QUANTITY = 4

  belongs_to :question

  validates :body, presence: true
  validate :validate_answers_per_question

  private

  def validate_answers_per_question
    answers_quantity = Answer.where(question_id: question).count
    errors.add(:answers, "can't be more then #{MAX_ANSWERS_QUANTITY} per question") \
                                    if answers_quantity >= MAX_ANSWERS_QUANTITY
  end
end
