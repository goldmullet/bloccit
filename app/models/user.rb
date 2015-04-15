class User < ActiveRecord::Base
  has_many :posts
    mount_uploader :avatar, AvatarUploader 
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  def admin?
   role == 'admin'
 end
 
 def moderator?
   role == 'moderator'
 end
 
end
