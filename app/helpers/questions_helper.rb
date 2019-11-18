module QuestionsHelper
  def question_header
    if @question.new_record?
      action_name = 'Create'
      test_title = @test.title
    else
      action_name = 'Edit'
      test_title = @question.test.title
    end
    "#{action_name} question for test '#{test_title}'"
  end

  def question_model(model)
    return model[1] if model.is_a?(Array)

    model
  end
end
