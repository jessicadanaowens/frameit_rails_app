class PicturesController < ApplicationController

  def index
    @picture = Picture.new
    # @user = User.index
  end


  def create
    # file_name = params['picture']['image'].original_filename.gsub(" ", "_")
    # url = params['picture']['image'].tempfile.to_s
    if current_user
      user_id = session[:user_id]
    else
      user_id = session[:guest_user_id]
    end

    @upload = Picture.new(
      :file_name=>params[:picture][:file_name],
      :avatar => params[:picture][:avatar],
      :user_id=>user_id
    )

    if @upload.save
      flash[:notice] = "Picture successfully uploaded"
      redirect_to pictures_path
    else
      render pictures_path
    end

  end

  private

  def allowed_parameters
    params.require(:picture).permit(@file_name, @url, @user_id)
  end
end