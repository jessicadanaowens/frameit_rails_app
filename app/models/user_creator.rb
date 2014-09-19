class UserCreator

  attr_accessor :user_parameters

  def initialize(user_parameters)
    @user_parameters = user_parameters
  end

  def new_user
    User.new(@user_parameters)
  end

  def save
    @saved = new_user.save
  end
end