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

    respond_to do |format|
      format.json { render :json => {}}
    end
  end

  def edit
    @picture = Picture.find(params[:id])
  end

  def update
    @picture = Picture.find(params[:id])
    @picture.update(
      :description=>params[:description]
    )
    respond_to do |format|
      format.json { render :json => {} }
    end
  end

  def show
    @picture = Picture.find(params[:id])
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
      respond_to do |format|
        format.json { render :json => {}}
      end
    else
      raise "error"
    end
  end

  def delete_share
    @share = Share.where(:picture_id => params[:id])
    @share.destroy_all

    respond_to do |format|
      format.json { render :json => {} }
    end

  end

  private

  def allowed_parameters
    params.require(:picture).permit(@file_name, @url, @user_id)
  end
end
