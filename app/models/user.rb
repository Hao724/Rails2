class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :rooms, dependent: :destroy
  has_many :reservations, dependent: :destroy
  
  has_one_attached :image

  mount_uploader :avatar, AvatarUploader
  
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable

        validates :name, presence: true
        validates :password, presence: true
        validates :email, presence: true
end
