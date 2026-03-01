class Product < ApplicationRecord
  belongs_to :category
  has_many :line_items

  validates :name, presence: true
  validates :price, presence: true

end
