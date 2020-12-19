class SupportMessage < ApplicationRecord
  validates :email, :message, presence: true
  validates :email,
            format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i,
                      message: "format is invalid" },
            length: { minimum: 5, maximum: 254 }
end
