class RemoveProductIdFromLineItems < ActiveRecord::Migration[5.2]
  def change
    # remove_index :line_items, :product_id
    # remove_column :line_items, :product_id, :bigint
  end
end
