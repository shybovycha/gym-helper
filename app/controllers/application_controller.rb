class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :save_return_to_param

  def after_sign_in_path_for(resource)
    path = session[:return_to] || user_dashboard_path
    session[:return_to] = nil
    path
  end

  def after_sign_up_path_for(resource)
    path = session[:return_to] || user_dashboard_path
    session[:return_to] = nil
    path
  end

  protected

  def save_return_to_param
    session[:return_to] = params[:return_to] if params[:return_to].present?
  end
end
