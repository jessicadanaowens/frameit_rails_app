class HomeController < ApplicationController

  def index
    @pictures = Picture.all
  end

  def new

  end
end