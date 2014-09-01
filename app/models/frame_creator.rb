class FrameCreator

  attr_accessor :params, :session

  def initialize(params, session)
    @params = params
    @session = session
  end

  def user_id
    if session[:guest_user_id]
      session[:guest_user_id]
    else
      session[:user_id]
    end
  end

  def frame
    @frame ||= Frame.new(
      :user_id => user_id,
      :name => params[:frame][:name],
      :image => params[:frame][:image],
      :length => params[:frame][:length],
      :width => params[:frame][:width]
    )
  end

  def save
    @saved = frame.save
  end
end