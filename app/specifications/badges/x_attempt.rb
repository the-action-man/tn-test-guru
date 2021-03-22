module Badges
  class XAttempt < AbstractRuleSpecification
    def satisfied?
      return false unless @test_passage.success
      return false if attempt_number > @value.to_i

      true
    end

    private

    def attempt_number
      TestPassage.where(test_id: @test_passage.test_id, user_id: @user.id).count
    end
  end
end
