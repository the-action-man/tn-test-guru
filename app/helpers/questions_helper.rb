module QuestionsHelper
  def question_header(action_name)
    "#{action_name} question for test #{@test.title}"
  end
end
