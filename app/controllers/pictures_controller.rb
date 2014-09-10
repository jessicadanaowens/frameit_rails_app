require 'rvg/rvg'

class PicturesController < ApplicationController
  include Magick

  def index
    @picture = Picture.new
    @wall = Wall.new
    @shares = Share.select(:picture_id).map(&:picture_id)

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
    @share = Share.where(:picture_id => params[:id])
    @share.destroy_all if @share
    @picture = Picture.find(params[:id])
    @picture.destroy
    redirect_to pictures_path
  end

  def edit
    @picture = Picture.find(params[:id])
  end

  def update
    params
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

  def image
    # FIXME: This needs to grab a real URL
    # FIXME: This belongs in its own controller
    RVG::dpi = 72
    frame_pieces = Image.read(Rails.root.join("app", "assets", "images", "ScallopedBorder.png"))
    rvg = RVG.new(5.in, 5.in) do |canvas|
      canvas.background_fill = 'white'

      canvas.g do |top_left|
        frame_pieces.each do |frame_piece|
          top_left.image(frame_piece)
        end
      end

      canvas.g.translate(2.5.in, 2.5.in - 1).rotate(-90) do |top_right|
        frame_pieces.each do |frame_piece|
          top_right.image(frame_piece)
        end
      end

      canvas.g.translate(5.in - 1, 2.5.in).rotate(90) do |bottom_right|
        frame_pieces.each do |frame_piece|
          bottom_right.image(frame_piece)
        end
      end

      canvas.g.translate(2.5.in - 1, 5.in - 1).rotate(180) do |bottom_left|
        frame_pieces.each do |frame_piece|
          bottom_left.image(frame_piece)
        end
      end
    end
    img = rvg.draw
    img.format = params[:format].upcase
    send_data img.to_blob
  end

  def share_picture
    def user_id
      if session[:guest_user_id]
        session[:guest_user_id]
      else
        session[:user_id]
      end
    end

    share = Share.new(
      :user_id => user_id,
      :picture_id => params[:id]
    )

    if share.save
      flash[:message] = "Thank you for sharing"
      redirect_to pictures_path
    else
      redirect_to pictures_path
    end
  end

  def delete_share
    @share = Share.where(:picture_id => params[:id])
    @share.destroy_all
    redirect_to pictures_path
  end

  private

  def allowed_parameters
    params.require(:picture).permit(@file_name, @url, @user_id)
  end
end
