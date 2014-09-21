class SearchController < ApplicationController

  def index
    frames = ["foobar", "foo", "bar"]
    render json:frames
  end
end