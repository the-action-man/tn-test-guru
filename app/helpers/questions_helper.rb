module QuestionsHelper
  def question_header(question)
    action_name = question.new_record? ? 'Create' : 'Edit'
    "#{action_name} question for test '#{question.test.title}'"
  end
end
