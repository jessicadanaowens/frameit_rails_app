class FramesController < ApplicationController

  def index
    @frame = Frame.new
  end

  def create
    frame_creator = FrameCreator.new(params, session)

    if frame_creator.save

      flash[:notice] = "Frame was successfully created"
      redirect_to frames_path
    else
      @frame = frame_creator.frame
      flash[:notice] = "Incorrect information"
      render :index
    end
  end
end