class PicturesController < ApplicationController

  def new
    @picture = Picture.new

  end

  def create
    file_name = params['picture']['image'].original_filename.gsub(" ", "_")
    url = params['picture']['image'].tempfile.to_s
    if current_user
      user_id = session[:user_id]
    else
      user_id = session[:guest_user_id]
    end

    @upload = Picture.new(
      :file_name=>file_name,
      :url=>url,
      :user_id=>user_id
    )

    if @upload.save
      redirect_to new_picture_path
    else
      render new_picture_path
    end

  end

  private

  def allowed_parameters
    params.require(:picture).permit(@file_name, @url, @user_id)
  end
end