class Room < ApplicationRecord
    belongs_to :user, dependent: :destroy
    has_many :reservations, dependent: :destroy


has_one_attached :image

mount_uploader :avatar, AvatarUploader

validates :name, presence: true
validates :syoukai, presence: true
validates :money, presence: true, numericality: true, numericality: {greater_than_or_equal_to: 1}
validates :address, presence: true


#確認画面
validates_acceptance_of :confirming
after_validation :check_confirming

def check_confirming
errors.delete(:confirming)
self.confirming = errors.empty? ? '1' : ''
end

end