class LineItem < ApplicationRecord
  belongs_to :product
  has_one :cart, required: false
  has_one :user, through: :carts
  belongs_to :order, required: false
  scope :created_at_asc, -> { order(created_at: :asc) }
  


  def total_price_line_items
    product.price.to_i * quantity.to_i
  end

  def line_items_count
    quantity.to_i
  end  
end
