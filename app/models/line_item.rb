class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :purchase


  validates :quantity, presence: true
  validates :quantity, numericality: true
end
