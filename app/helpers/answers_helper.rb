module AnswersHelper
  def answer_header(answer)
    action_name = answer.new_record? ? 'Create' : 'Edit'
    "#{action_name} answer for question '#{answer.question.body}'"
  end
end
