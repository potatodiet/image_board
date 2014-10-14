require 'bcrypt'

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise(:database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable)

  validates(:name, presence: true)
  validates(:email, presence: true)

  has_many(:images, :foreign_key => 'uploader_id', :dependent => :destroy)
  has_many(:comments, :foreign_key => 'commenter_id', :dependent => :destroy)

  ROLES = %w[regular admin]

  def role?(base_role)
    ROLES.index(base_role.to_s) <= ROLES.index(role)
  end
end
