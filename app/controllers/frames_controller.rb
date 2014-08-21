class FramesController < ApplicationController

  def index
    @frame = Frame.new
  end

  def create

    if guest_user
      id = session[:guest_user_id]
    else
      id = session[:user_id]
    end

    @frame = Frame.new(
      :user_id => id,
      :name =>params[:frame][:name]
    )

    if @frame.save

      frame_sizes_array = params[:frame_size_join][:frame_size_ids].select do |id|
        id != ""
      end
      new_frame_id = Frame.last.id
    

      frame_sizes_array.each do |id|
        unless id == nil
        Framesizejoin.create(
          :frame_id => new_frame_id,
          :frame_size_id => id
        )
        end

      end

      flash[:notice] = "Frame was successfully created"
      redirect_to frames_path
    else
      flash[:notice] = "Incorrect information"
      render :index
    end
  end
end