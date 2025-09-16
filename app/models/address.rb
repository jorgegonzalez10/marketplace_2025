class Address < ApplicationRecord
  belongs_to :user
  validates :street, :city, :zip, :country, :type, :user_id presence: true
end
