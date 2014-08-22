class SessionsController < ApplicationController

  def new

  end

  def create
    session_params = params[:session]
    user = User.authenticate(session_params[:email], session_params[:password])

    if user
      session.clear
      session[:user_id] = user.id
      redirect_to root_path, flash: { notice: "Thank you for signing in"}
    else
      redirect_to sign_in_path, flash: { error: "Incorrect email or password" }
    end
  end

  def delete
    session.clear
    redirect_to root_url
  end
end