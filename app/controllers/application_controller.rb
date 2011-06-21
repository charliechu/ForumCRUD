class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def require_is_admin
    unless user_signed_in? && current_user.is_admin?
      flash[:notice] = "權限不足"
      redirect_to root_path
    end
  end
end
