class AddIsInStockToPlant < ActiveRecord::Migration[6.1]
  def change
    add_column :plants, :is_in_stock, :boolean, null: false, default: true
  end
end
