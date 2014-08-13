class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :product, index: true
      t.references :user, index: true
      t.text :body
      t.integer :rating

      t.timestamps
    end
  end
end
