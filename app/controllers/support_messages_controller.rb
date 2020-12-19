class SupportMessagesController < ApplicationController
  def new
    @support_message = SupportMessage.new
  end

  def create
    @support_message = SupportMessage.new(test_params)
    if @support_message.save
      redirect_to root_path, notice: "The message is sent to administrator!"
    else
      render :new
    end
  end

  private

  def test_params
    params.require(:support_message).permit(:email, :message)
  end
end
