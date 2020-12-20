class SupportMessage < ApplicationRecord
  validates :email, :message, presence: true
  validates :email,
            format: { with: URI::MailTo::EMAIL_REGEXP, message: "format is invalid" },
            length: { minimum: 5, maximum: 254 }
end
