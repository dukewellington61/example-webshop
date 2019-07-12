class AddProductIdToLineItems < ActiveRecord::Migration[5.2]
  def change
    add_column :line_items, :product_id, :integer
    add_index :line_items, :product_id
  end
end
