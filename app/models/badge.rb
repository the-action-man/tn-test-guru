class Badge < ApplicationRecord
  has_many :users, through: :user_badges
  belongs_to :rule
end
