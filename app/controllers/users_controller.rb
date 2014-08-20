class UsersController < ApplicationController
  def new
    @source = params[:source] if params[:source]
    @user = User.new
  end

  def create
    @user = User.new(allowed_parameters)

    if @user.save

      #if the user successfully registers
      #create a user session id
      #find all the pictures in the table that have the guest user id
      #replace the guest user id in the pictures table with the new user id
      #delete the guest from the database

      session[:user_id] = @user.id

      if guest_user

        pictures = Picture.where(user_id: session[:guest_user_id])
        if pictures
          pictures.update_all(user_id: session[:user_id])
        end

        session.delete(:guest_user_id)
      end


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