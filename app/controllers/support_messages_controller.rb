class SupportMessagesController < ApplicationController
  def new
    @support_message = SupportMessage.new
  end

  def create
    @support_message = SupportMessage.new(test_params)
    if @support_message.save
      SupportMessageMailer.with(support_message: @support_message).customer_request.deliver_later
      redirect_to root_path, notice: t(".success_sent")
    else
      render :new
    end
  end

  private

  def test_params
    params.require(:support_message).permit(:email, :message)
  end
end
