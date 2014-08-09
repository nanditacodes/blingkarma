class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :user, index: true
      t.datetime :order_date
      t.datetime :shipment_date
      t.string :order_status
      t.decimal :order_total, precision: 5, scale: 2

      t.timestamps
    end
  end
end
