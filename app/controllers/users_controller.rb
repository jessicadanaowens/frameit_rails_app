class UsersController < ApplicationController
  def new
    @source = params[:source] if params[:source]
    @user = User.new
  end

  def create

    user_creator = UserCreator.new(allowed_parameters)
    @user = User.new(allowed_parameters)

    if @user.save

      if guest_user

        pictures = Picture.where(user: guest_user)

        pictures.update_all(user_id: @user.id)

        session.delete(:guest_user_id)
      end

      session[:user_id] = @user.id
      if params[:source] == "guest_upload"
        redirect_to pictures_path
      else
        redirect_to root_url
      end

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