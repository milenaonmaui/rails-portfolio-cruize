class Cruise < ApplicationRecord
    belongs_to :category
    has_many :bookings
    has_many :users, through: :bookings
    validates :name, presence: true
    scope :by_category, ->(category_ids) { where(category_id: category_ids) }
    scope :featured, -> {order(seats_left: :desc).limit(3)}

    def children_allowed?
        min_age <= 12
    end

end
