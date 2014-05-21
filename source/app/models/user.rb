require 'bcrypt'

class User < ActiveRecord::Base
  attr_accessor(:password)

  before_save(:encrypt_password)

  validates_presence_of(:username)
  validates_uniqueness_of(:username)
  validates_presence_of(:password, :on => :create)

  has_many(:images, :foreign_key => 'uploader_id')

  def self.authenticate(username, password)
    user = User.where(:username => username).first
    if user && user.password_hash == BCrypt::Engine.hash_secret(password,
        user.password_salt)
      return user
    else
      return nil
    end
  end

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
end
