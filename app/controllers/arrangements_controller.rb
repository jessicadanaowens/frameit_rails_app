class ArrangementsController < ApplicationController

  def create
    Arrangement.create(
      :user_id => current_user.id,
      :url => params["url"]
    )

    respond_to do |format|
      format.json { render :json => {} }
    end
  end

  def destroy
    @arrangement = Arrangement.find(params[:id])
    @arrangement.destroy

    respond_to do |format|
      format.json { render :json => {}}
    end
  end

end