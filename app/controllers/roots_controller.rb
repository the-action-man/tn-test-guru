class RootsController < ApplicationController
  def root
    return redirect_to root_admin_path if current_user.admin?

    redirect_to root_user_path
  end
end
