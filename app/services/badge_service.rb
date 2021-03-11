class BadgeService
  attr_reader :badges

  def initialize(test_passage)
    @badges = []
    @test_passage = test_passage
    @user = test_passage.user
  end

  def give_badges
    collect_badges
    add_badges_to_user
  end

  def give_badges?
    @badges.size.positive?
  end

  private

  attr_reader :test_passage, :user

  def collect_badges
    Rule.all.each do |rule|
      badges_to_add = send(rule.name, rule)
      @badges += badges_to_add if badges_to_add
    end
  end

  def add_badges_to_user
    @badges.each do |badge|
      user_badge = UserBadge.where(user_id: @user.id, badge_id: badge.id)&.first
      if user_badge
        user_badge.count += 1
        user_badge.save!
      else
        @user.badges.push(badge)
      end
    end
  end

  def badges_by_rule_id(rule_id)
    Badge.where(rule_id: rule_id).to_a
  end

  def first_attempt(rule)
    return nil unless @test_passage.success
    return nil if TestPassage.where(test_id: test_passage.test_id, user_id: @user.id).count > 1

    badges_by_rule_id(rule.id)
  end

  def all_from_category_backend(rule)
    return nil unless @test_passage.success

    test_ids = Test.ids_by_category("backend").pluck(:id)
    test_passages = TestPassage
                        .where(user_id: @user.id, test_id: test_ids, success: true)
                        .group(:test_id)
                        .count
    return nil if (test_passages.keys - test_ids).size.positive?

    badges_by_rule_id(rule.id)
  end

  def elementary_of_category_backend(rule)
    return nil unless @test_passage.success

    test_ids = Test.where(level: 0).ids_by_category("backend").pluck(:id)
    test_passages = TestPassage
                        .where(user_id: @user.id, test_id: test_ids, success: true)
                        .group(:test_id)
                        .count
    return nil if (test_passages.keys - test_ids).size.positive?

    badges_by_rule_id(rule.id)
  end
end
