class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy
  has_many :products, through: :line_items
  has_one :user
  has_one :order, through: :user
  

  def total_price_cart
    line_items.to_a.sum { |item| item.total_price_line_items }
  end

  def line_items_count
    line_items.to_a.sum { |item| item.line_items_count }
  end

  def created_at_asc
    line_items.created_at_asc
  end

end
