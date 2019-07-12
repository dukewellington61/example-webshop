class AddNullFalseToOrders < ActiveRecord::Migration[5.2]
  def change
    change_column :orders, :created_at, :datetime, default: Time.now
  end
end
