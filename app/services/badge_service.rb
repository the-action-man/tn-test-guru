class BadgeService
  RULES = {
      x_attempt: Badges::XAttempt,
      all_from_category: Badges::AllFromCategory,
      elementary_of_category: Badges::ElementaryOfCategory,
  }.freeze

  def self.select_box_values
    [
      [I18n.t('admin.badges.rule_type.x_attempt'), "x_attempt"],
      [I18n.t('admin.badges.rule_type.all_from_category'), "all_from_category"],
      [I18n.t('admin.badges.rule_type.elementary_of_category'), "elementary_of_category"],
    ]
  end

  def self.validate_values
    RULES.each_with_object([]) { |(rule, _), array| array << rule.to_s }
  end

  attr_reader :badges

  def initialize(test_passage)
    @badges = []
    @test_passage = test_passage
    @user = test_passage.user
  end

  def call
    collect_badges
    add_badges_to_user
    badge_ids
  end

  private

  attr_reader :test_passage, :user

  def badge_ids
    @badges.each_with_object([]) { |badge, ids| ids << badge.id }
  end

  def collect_badges
    Badge.find_each do |badge|
      rule = RULES[badge.rule_type.to_sym].new(test_passage: @test_passage,
                                               value: badge.rule_value)
      @badges << badge if rule.satisfied?
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
end
