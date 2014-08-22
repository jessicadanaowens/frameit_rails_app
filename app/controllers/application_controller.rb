class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def signed_in?
    current_user.present? || guest_user.present?
  end

  def current_user
    if session[:user_id]
      User.find_by(id: session[:user_id])
    else
      User.find_by(id: session[:guest_user_id])
    end

  end

  def guest_user
    if session[:guest_user_id]
      User.find_by(id: session[:guest_user_id])
    end
  end

  helper_method :current_user, :signed_in?, :guest_user
end
