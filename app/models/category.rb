class Category < ApplicationRecord
  has_many :tests, dependent: :nullify

  validates :title, presence: true
end
