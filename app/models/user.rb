class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :comments
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  mount_uploader :avatar, AvatarUploader

  # admin? 讓我們用來判斷單個user是否有 admin 角色，列如：current_user.admin?

  def admin?
    self.role == "admin"
  end
end
