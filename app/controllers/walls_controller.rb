class WallsController < ApplicationController

  def index
    @wall = Wall.new
    @picture = Picture.find(params[:id])
  end

  def create

    def user_id
      if session[:guest_user_id]
        session[:guest_user_id]
      else
        session[:user_id]
      end
    end


    @wall = Wall.new(
      :description => params[:wall][:description],
      :height => params[:wall][:height],
      :width => params[:wall][:width],
      :image => params[:wall][:image],
      :user_id => user_id
    )

    if @wall.save
      flash[:notice] = "Picture of room successfully uploaded"
      redirect_to user_pictures_path(current_user)
    else
      redirect_to user_pictures_path(current_user)
    end
  end

  def destroy
    Wall.find(params[:id]).destroy

    respond_to do |format|
      format.json { render :json => {}}
    end
  end



end