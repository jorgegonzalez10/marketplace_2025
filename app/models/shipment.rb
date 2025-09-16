class Shipment < ApplicationRecord
  belongs_to :order
  validates :order_id, :provider, :tracking_number, :status, :cost, presence: true 
end
