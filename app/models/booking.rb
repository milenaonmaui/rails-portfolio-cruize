class Booking < ApplicationRecord
    belongs_to :user
    belongs_to :cruise

    validates :num_adults, :numericality => {greater_than: 0}
end
