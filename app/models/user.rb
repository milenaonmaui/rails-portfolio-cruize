class User < ApplicationRecord
    has_secure_password
    validates :email, presence: true
    validates :email, uniqueness: true
    has_many :bookings
    has_many :cruises, through: :bookings
end
