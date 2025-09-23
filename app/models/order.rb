class Order < ApplicationRecord
  belongs_to :user
  belongs_to :address
  has_one :shipment
  has_one :payment
  has_many :products
  has_many :order_items
  validates :user_id, :total, :status, :address_id, presence: true
end
