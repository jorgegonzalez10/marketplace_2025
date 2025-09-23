class Product < ApplicationRecord
  belongs_to :user
  has_many :cart_items
  has_many :order_items
  validates :title, presence: true, length: { minimum: 3 }
  validates :price, presence: true,  numericality: { greater_than: 0 }
  belongs_to :category
end
