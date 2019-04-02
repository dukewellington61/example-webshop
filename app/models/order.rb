class Order < ApplicationRecord
  has_many :products, through: :line_items
  belongs_to :user
  has_one :cart, through: :user
  has_many :line_items
end
