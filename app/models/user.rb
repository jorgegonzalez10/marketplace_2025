class User < ApplicationRecord
  has_secure_password
  has_many :products
  has_many :addresses
  validates :email, presence: true, uniqueness: true, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: "Invalid email" }
  validates :password, presence: true, length: { minimum: 6 }
  has_one :cart
end
