class User < ApplicationRecord
  has_many :carts
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end
