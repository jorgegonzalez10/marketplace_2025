class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product
  validates :price, presence: true,  numericality: { greater_than: 0 }
  validates :quantity, presence: true,  numericality: { :greater_than_or_equal_to 1 }
  validates :product, presence: true 
end
