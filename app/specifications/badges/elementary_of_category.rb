module Badges
  class ElementaryOfCategory < AbstractRuleSpecification
    def satisfied?
      return false unless @test_passage.success

      test_ids = Test.where(level: 0).ids_by_category(@value).pluck(:id)
      test_passages = TestPassage
                          .where(user_id: @user.id, test_id: test_ids, success: true)
                          .group(:test_id)
                          .count
      (test_passages.keys - test_ids).size.zero?
    end
  end
end
