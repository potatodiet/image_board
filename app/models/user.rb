require 'bcrypt'

class User < ActiveRecord::Base
  attr_accessor(:password)

  before_save(:encrypt_password)

  validates_presence_of(:username)
  validates_uniqueness_of(:username)
  validates_presence_of(:password, :on => :create)

  has_many(:images, :foreign_key => 'uploader_id', :dependent => :destroy)
  has_many(:comments, :foreign_key => 'commenter_id', :dependent => :destroy)

  ROLES = %w[regular admin]

  def authenticate(password)
    return false if is_locked?

    if password_hash == BCrypt::Engine.hash_secret(password, password_salt)
      self.failed_login_attempts = 0
      save

      return true
    else
      self.failed_login_attempts += 1
      self.latest_failed_login_attempt = Time.now
      save

      return false
    end
  end

  def is_locked?
    if failed_login_attempts > Settings.user.attempts_before_lockout &&
        (Time.now - latest_failed_login_attempt) / 60 < Settings.user.lockout_time
      return true
    elsif failed_login_attempts > Settings.user.attempts_before_lockout
      self.failed_login_attempts = 0
      save

      return false
    else
      return false
    end
  end

  def needs_captcha?
    if failed_login_attempts > Settings.user.attempts_before_captcha &&
        failed_login_attempts < Settings.user.attempts_before_lockout
      return true
    else
      return false
    end
  end

  # Returns time left as locked in minutes
  def lockout_time_left
    return (Settings.user.lockout_time - (Time.now - latest_failed_login_attempt) / 60).ceil
  end

  def role?(base_role)
    return ROLES.index(base_role.to_s) <= ROLES.index(role)
  end

  private
    def encrypt_password
      if password.present?
        self.password_salt = BCrypt::Engine.generate_salt
        self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
      end
    end
end
