class WallsController < ApplicationController

  def index
    @wall = Wall.new
    @picture = Picture.find(params[:id])
  end

  def create
    @wall = Wall.new(
      :description => params[:wall][:description],
      :height => params[:wall][:height],
      :width => params[:wall][:width],
      :image => params[:wall][:image]
    )

    if @wall.save
      flash[:notice] = "Picture of room successfully uploaded"
      redirect_to "/pictures"
    else
      redirect_to "/pictures"
    end
  end

end