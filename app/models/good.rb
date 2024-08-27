class Good < ApplicationRecord
  belongs_to :category
  has_many :cart_items
  validates :name, :price, :weight, presence: true
end
