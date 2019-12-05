module TestPassagesHelper
  def current_question_info(test_passage)
    current_question_number = test_passage.current_question.number
    quantity_of_questions = test_passage.test.questions.size
    "Question #{current_question_number} of #{quantity_of_questions}:"
  end
end
