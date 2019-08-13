class User < ApplicationRecord
    has_secure_password
    validates :email, presence: true
    validates :email, uniqueness: true
    has_many :bookings
    has_many :cruises, through: :bookings
    scope :most_bookings, -> {User.joins(:bookings).group("users.id").order("COUNT(bookings.user_id) DESC")}
    def self.find_or_create_by_omniauth(auth)
        where(email: auth.info.email).first_or_initialize do |user|
            user.email = auth.info.email
            user.name = auth.info.name
            user.password = SecureRandom.hex
        end
    end
end
