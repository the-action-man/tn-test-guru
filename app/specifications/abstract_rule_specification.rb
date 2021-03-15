class AbstractRuleSpecification
  def initialize(test_passage: test_passage, value: value)
    @test_passage = test_passage
    @user = test_passage.user
    @value = value
  end

  def satisfied?
    railse "#{__method__} undefined for #{self.class}"
  end
end
