class Reservation < ApplicationRecord
    belongs_to :user, dependent: :destroy
    belongs_to :room, dependent: :destroy

    validates :ninzuu, numericality: true, numericality: {greater_than_or_equal_to: 1}
    validate :start_end


        private

    def start_end
        errors.add(:end_day, 'は開始日よりあとの日付にしてください') if end_day.nil? || end_day < start_day
    end
end
