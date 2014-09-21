class SharesController < ApplicationController

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
end