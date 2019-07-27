class Booking < ApplicationRecord
    belongs_to :user
    belongs_to :cruise

    validates :num_adults, :numericality => {greater_than: 0, :message => "At least one adult must be present"}
    validates :num_children, :numericality => {greater_than_or_equal_to: 0,  :allow_nil => true, :message => "Can't be negative"}
    validate :seats_available?

    def seats_available?
        if (self.num_adults ||=0) + (self.num_children||=0) > self.cruise.seats_left
            errors.add(:base, "Insufficient seats")
            return false
        else
            true
        end
    end

    def cost
        total = self.num_adults*self.cruise.price_adult
        total += self.num_children*self.cruise.price_child if num_children
        return total
    end
end
