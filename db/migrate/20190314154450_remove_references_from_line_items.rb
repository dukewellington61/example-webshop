class RemoveReferencesFromLineItems < ActiveRecord::Migration[5.2]
  def change
    # remove_column :line_items, :references, :rails
    # remove_column :line_items, :g, :string
    # remove_column :line_items, :migration, :string
    # remove_column :line_items, :RemoveReferencesFromLineItems, :string
    remove_column :line_items, :references, :string
  end
end
