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
      :file_name=>params[:picture][:file_name],
      :image => params[:picture][:image],
      :height => params[:picture][:height],
      :width => params[:picture][:width],
      :user_id=> id
    )
  end

  def save
    @saved = picture.save
  end

  def update
    @picture = Picture.find(params[:id])
    @picture.update(
      :file_name=>params[:file_name]
    )
  end

end