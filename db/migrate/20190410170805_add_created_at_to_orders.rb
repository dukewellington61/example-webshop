class AddCreatedAtToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :created_at, :datetime, null: false
  end
end
