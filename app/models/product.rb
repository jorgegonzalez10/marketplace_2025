class Product < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, length: { minimum: 3 }
  validates :price, presence: true,  numericality: { greater_than: 0 }
end
