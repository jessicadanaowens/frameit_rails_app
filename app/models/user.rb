class User < ActiveRecord::Base
  attr_accessor :password
  before_save :encrypt_password

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

  def password_matches?(password)
    hashed_password = BCrypt::Engine.hash_secret(password, password_salt)
    hashed_password == password_hash
  end

  def self.authenticate(email, password)
    user = User.find_by(email: email)

    if user && user.password_matches?(password)
      user
    end
  end
end