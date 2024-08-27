class Chat < ApplicationRecord
  belongs_to :customer, class_name: 'User'
  belongs_to :consultant, class_name: 'User'
  has_many :messages, dependent: :destroy
end
