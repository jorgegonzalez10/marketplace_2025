class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product
  validates :price_at_purchase, presence: true,  numericality: { greater_than: 0 }
  validates :quantity, presence: true,  numericality: { :greater_than_or_equal_to 1 }
  validates :product_id, :order_id, presence: true
end
