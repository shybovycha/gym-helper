class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    params[:return_to] || user_path(current_user)
  end

  def after_sign_up_path_for(resource)
    params[:return_to] || user_path(current_user)
  end
end
