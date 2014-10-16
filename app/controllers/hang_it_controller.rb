class HangItController < ApplicationController

  def index
    @walls = current_user.walls

    respond_to do |format|
      format.html
      format.json { render :json => @walls }
    end
  end
end