class Category < ApplicationRecord
    has_many :products

    validates :product_category, presence: true
    validates :product_category, uniqueness: true
end
