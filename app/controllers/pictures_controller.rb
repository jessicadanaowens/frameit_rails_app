class PicturesController < ApplicationController

  def index
    @picture = Picture.new
  end

  def create

    redirect_to root_url

  end

end