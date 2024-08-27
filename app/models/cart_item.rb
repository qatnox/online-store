class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :good
  validates :quantity, presence: true
end
