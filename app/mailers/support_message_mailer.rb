class SupportMessageMailer < ApplicationMailer
  def customer_request
    @support_message = params[:support_message]
    admin_emails.each { |email| mail(to: email, subject: "Customer Request #{@support_message.id}") }
  end

  private

  def admin_emails
    Admin.pluck(:email)
  end
end
