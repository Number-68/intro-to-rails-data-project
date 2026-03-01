class Purchase < ApplicationRecord
  belongs_to :customer
  has_many :line_items


  validates :date, presence: true
  validates :total_price, presence: true
  
end
