class Badge < ApplicationRecord
  enum rule_type: { x_attempt: 0, all_from_category: 1, elementary_of_category: 2 }

  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges

  validates :name, :url, :rule_type, :rule_value, presence: true
  validates :rule_type, inclusion: { in: Badge.rule_types.keys,
                                     message: "'%{value}' is not a valid" }

  def self.select_box_values
    [
      [I18n.t('admin.badges.rule_type.x_attempt'), Badge.rule_types[:x_attempt]],
      [I18n.t('admin.badges.rule_type.all_from_category'), Badge.rule_types[:all_from_category]],
      [I18n.t('admin.badges.rule_type.elementary_of_category'),
       Badge.rule_types[:elementary_of_category]],
    ]
  end
end
