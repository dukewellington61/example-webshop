class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart
  has_one :user, through: :carts

  def total_price_line_items
    product.price.to_i * quantity.to_i
  end

  def line_items_count
    quantity.to_i
  end
end
