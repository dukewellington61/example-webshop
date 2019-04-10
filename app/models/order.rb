class Order < ApplicationRecord
  has_many :products, through: :line_items
  belongs_to :user
  has_one :cart, through: :user
  has_many :line_items

  scope :orders_asc, -> { order(id: :asc) }
end

def all_orders_but_latest
  @orders[0..-2]
end

def latest_order
  @orders.orders_asc.last
end
