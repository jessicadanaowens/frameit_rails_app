class FramesController < ApplicationController

  def index
    @frame = Frame.new
    @frames = Frame.all
    respond_to do |format|
      format.html
      format.json { render :json => @frames }
    end
  end

  def create
    def user_id
      if session[:guest_user_id]
        session[:guest_user_id]
      else
        session[:user_id]
      end
    end

    @frame = Frame.new(
      allowed_params
    )
    if @frame.save
      flash[:notice] = "Frame was successfully created"
      redirect_to frames_path
    else
      render :index
    end
  end

  def destroy
    Frame.find(params[:id]).destroy

    respond_to do |format|
      format.json { render :json => {}}
    end
  end

  private

  def allowed_params
    params.require(:frame).permit(:inner_height, :inner_width, :width_of_moulding, :name, :image)
  end
end