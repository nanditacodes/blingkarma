class AddLineTotalToOrderProducts < ActiveRecord::Migration
  def change
    add_column :order_products, :line_total, :decimal, precision: 5, scale: 2
  end
end
