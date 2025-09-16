class Payment < ApplicationRecord
  belongs_to :order
  validates :order_id, :amount, :method, :status, presence: true 
end
