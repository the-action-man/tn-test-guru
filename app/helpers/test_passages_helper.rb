module TestPassagesHelper
  def current_question_info(test_passage)
    current_question_number = test_passage.current_question.number
    "Question #{current_question_number} of #{test_passage.total_questions}:"
  end

  def result_message(test_passage)
    prefix = test_passage.passed? ? 'Success!' : 'Failed! Try again!'
    "#{prefix} #{test_passage.correct_percent}% question are correct."
  end

  def result_message_color(test_passage)
    test_passage.passed? ? 'green' : 'red'
  end
end
