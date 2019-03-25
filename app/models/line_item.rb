class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart
  has_one :user, through: :cart

  def total_price
    product.price.to_i * quantity.to_i
  end
end
