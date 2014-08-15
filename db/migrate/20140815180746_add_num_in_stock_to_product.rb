class AddNumInStockToProduct < ActiveRecord::Migration
  def change
    add_column :products, :num_in_stock, :integer, default: 10
  end
end
