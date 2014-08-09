class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.text :title
      t.references :category, index: true
      t.string :remote_image_url
      t.string :image
      t.decimal :price, precision: 5, scale: 2
      t.decimal :list_price, precision: 5, scale: 2
      t.decimal :discount_percent, precision: 4, scale: 2
      t.boolean :available, default: false
      t.boolean :on_sale, default: false

      t.timestamps
    end
  end
end
