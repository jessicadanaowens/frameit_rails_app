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


end