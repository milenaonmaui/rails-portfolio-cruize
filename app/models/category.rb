class Category < ApplicationRecord
    has_many :cruises
    validates :name, uniqueness: true
end
