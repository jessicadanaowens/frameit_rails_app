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
      :user_id=> id
    )
  end

  def save
    @saved = picture.save
  end

end