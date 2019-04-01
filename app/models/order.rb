class Order < ApplicationRecord
  belongs_to :product
  belongs_to :user
  has_one :cart, through: :user
end
