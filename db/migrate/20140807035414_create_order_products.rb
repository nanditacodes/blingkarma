class CreateOrderProducts < ActiveRecord::Migration
  def change
    create_table :order_products do |t|
      t.references :order, index: true
      t.references :product, index: true
      t.integer :quantity
      t.decimal :price, precision: 5, scale: 2

      t.timestamps
    end
  end
end
