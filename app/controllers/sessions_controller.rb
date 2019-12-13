class SessionsController < ApplicationController
  skip_before_action :authenticate_user!

  def new; end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      if cookies.key?(:original_url)
        redirect_to cookies.delete(:original_url)
      else
        redirect_to root_path
      end
    else
      flash.now[:alert] = 'Are you Guru? Verify your Email and Password, please'
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end
end
