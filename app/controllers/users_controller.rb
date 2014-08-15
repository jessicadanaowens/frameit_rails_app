class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create

    @user = allowed_parameters ? User.new(allowed_parameters) : User.new_guest

    if @user.save
      session.clear
      session[:user_id] = @user.id

      redirect_to root_url
    else
      render "new"
    end
  end

  def create_guest
    unless session[:user_id]
      u = User.new(
        :email => "guest_#{Time.now.to_i}#{rand(100)}@example.com",
        :password => "12345",
        :password_confirmation => "12345",
        :guest => true)
      u.save!(:validate => false)
      session[:guest_user_id] = u.id
    end

    redirect_to pictures_path

  end

  private

  def allowed_parameters
      params.require(:user).permit(:email, :password, :confirmation)
  end

end