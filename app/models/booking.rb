class Booking < ApplicationRecord
    
   
    belongs_to :user
    belongs_to :cruise

    validates :num_adults, :numericality => {greater_than: 0, :message => "At least one adult must be present"}
    validates :num_children, :numericality => {greater_than_or_equal_to: 0,  :allow_nil => true, :message => "Can't be negative"}
    validate :seats_available?

    after_create :update_seats_left_new
    before_destroy :update_seats_left_destroy
    before_save :recalculate_seats_left

    def seats_total  
        self.num_adults.to_i + self.num_children.to_i
    end

    def seats_available?
        if self.seats_total > self.cruise.seats_left
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

    def update_seats_left_new
        self.cruise.seats_left -= self.seats_total
        self.cruise.save
    end

    def update_seats_left_destroy
        self.cruise.seats_left += self.seats_total
        self.cruise.save
    end

    def recalculate_seats_left
        if (self.num_adults_changed? || self.num_children_changed?) && self.valid?
            diff = self.num_adults + self.num_children.to_i - self.num_adults_was - self.num_children_was.to_i
            self.cruise.seats_left -= diff
            binding.pry
            self.cruise.save
        end
    end
end
