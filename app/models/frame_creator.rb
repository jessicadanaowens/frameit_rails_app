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
      :image => params[:frame][:image]
    )
  end

  def save
    @saved = frame.save
    if @saved
      create_joins
    end
    @saved
  end

  def frame_size_ids
    params[:frame_size_join][:frame_size_ids].select do |id|
      !id.blank?
    end
  end

  def create_joins
    frame_size_ids.each do |id|
      FrameSizeJoin.create(
        :frame_id => frame.id,
        :frame_size_id => id
      )
    end
  end
end