class TestPassage < ApplicationRecord
  MIN_PERCENT_TO_BE_PASSED = 85

  belongs_to :test
  belongs_to :user
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :set_current_question

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    save!
  end

  def total_questions
    self.test.questions.size
  end

  def passed?
    correct_percent >= MIN_PERCENT_TO_BE_PASSED
  end

  def correct_percent
    @correct_percent ||= calc_percent_correct_questions
  end

  private

  def set_current_question
    return unless test.present? # added to avoid err in IRB code

    self.current_question = if current_question.nil?
                              test.questions.first
                            else
                              next_question
                            end
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end

  def correct_answer?(answer_ids)
    return false if answer_ids.nil?

    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def calc_percent_correct_questions
    correct_questions * 100 / total_questions
  end
end
