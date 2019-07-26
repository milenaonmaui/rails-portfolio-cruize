class Booking < ApplicationRecord
    belongs_to :user
    belongs_to :cruise

    validates :num_adults, :numericality => {greater_than: 0, :message => "At least one adult must be present"}

    
    def cost
        total = num_adults*self.cruise.price_adult
        total += num_children*self.cruise.price_child if num_children
        return total
    end
end
