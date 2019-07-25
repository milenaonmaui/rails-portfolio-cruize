class Booking < ApplicationRecord
    belongs_to :user
    belongs_to :cruise

    validates :num_adults, :numericality => {greater_than: 0}

    
    def cost
        num_adults*self.cruise.price_adult + num_children*self.cruise.price_child
    end
end
