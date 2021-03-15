module Badges
  class AllFromCategory < AbstractRuleSpecification
    def satisfied?
      return false unless @test_passage.success

      test_ids = Test.ids_by_category(@value).pluck(:id)
      test_passages = TestPassage
                          .where(user_id: @user.id, test_id: test_ids, success: true)
                          .group(:test_id)
                          .count
      return false if (test_passages.keys - test_ids).size.positive?

      true
    end
  end
end
