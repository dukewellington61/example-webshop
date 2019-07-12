class RemoveCreatedAtDefaultValueFromOrders < ActiveRecord::Migration[5.2]
  def change
    change_column_default :orders, :created_at, nil
  end
end
