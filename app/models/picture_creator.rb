class PictureCreator

  attr_accessor :session, :params

  def initialize(session, params)
    @session = session
    @params = params
  end


  def id
    if session[:user_id]
      session[:user_id]
    else
      session[:guest_user_id]
    end
  end

  def picture
    @picture ||= Picture.new(
      :description=>params[:picture][:description],
      :image => params[:picture][:image],
      :height => params[:picture][:height],
      :width => params[:picture][:width],
      :user_id=> id
    )
  end

  def save
    @saved = picture.save
  end

end