class AddNullFalseToOrdersTwo < ActiveRecord::Migration[5.2]
  def change
    change_column :orders, :created_at, :datetime, null: false
  end
end
