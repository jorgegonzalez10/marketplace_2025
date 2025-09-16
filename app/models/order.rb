class Order < ApplicationRecord
  belongs_to :user
  belongs_to :address
  has_many :products
  has_many :cart_items
  validates :user_id, :total, :status, :address_id, presence: true 
end
