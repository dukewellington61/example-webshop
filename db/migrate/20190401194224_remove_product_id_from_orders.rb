class RemoveProductIdFromOrders < ActiveRecord::Migration[5.2]
  def change
    remove_index :orders, :product_id
    remove_column :orders, :product_id, :integer
  end
end
