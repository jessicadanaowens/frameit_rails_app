class PicturesController < ApplicationController

  def index
    @picture = Picture.new
  end

  def create

    picture_creator = PictureCreator.new(session, params)

    @picture = Picture.new

    # @upload = Picture.new(
    #   :file_name=>params[:picture][:file_name],
    #   :image => params[:picture][:image],
    #   :user_id=>picture_creator.id
    # )

    if picture_creator.save
      flash[:notice] = "Picture successfully uploaded"
      redirect_to "/pictures"
    else
      flash[:notice] = "Please select a picture to upload"
      redirect_to "/pictures"
    end

  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy

    redirect_to pictures_path
  end

  def edit
    @picture = Picture.find(params[:id])
  end

  def update

    if session[:user_id]
      user_id = session[:user_id]
    else
      user_id = session[:guest_user_id]
    end

    @picture = Picture.find(params[:id])
    @picture.update(
      :file_name=>params[:picture][:file_name],
      :image => params[:picture][:image],
      :user_id=>user_id
    )
    redirect_to pictures_path
  end

  def show
    @picture = Picture.find(params[:id])

  end

  private

  def allowed_parameters
    params.require(:picture).permit(@file_name, @url, @user_id)
  end
end
