class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :good

  validates :quantity, :price, presence: true
end
