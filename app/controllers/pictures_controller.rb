class PicturesController < ApplicationController

  def index
    @picture = Picture.new
    @wall = Wall.new

  end

  def create

    picture_creator = PictureCreator.new(session, params)

    @picture = Picture.new

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
    picture_creator = PictureCreator.new(session, params)
    picture_creator.update
    redirect_to pictures_path
  end

  def show

    @picture = Picture.find(params[:id])
    canvas_width = 200
    picture_width = @picture.width.to_i
    @pixels_per_inch = canvas_width / picture_width
    @canvas_height = @picture.height.to_i * @pixels_per_inch
    @picture_height = @picture.height.to_i * @pixels_per_inch

  end

  private

  def allowed_parameters
    params.require(:picture).permit(@file_name, @url, @user_id)
  end
end
