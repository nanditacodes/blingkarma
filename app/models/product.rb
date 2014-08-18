class Product < ActiveRecord::Base

  validates :title, presence: true, uniqueness: true, on: [:create]
  validates :price, numericality: { greater_than: 0 }
  validates :list_price, numericality: { greater_than: 0 }
  validates :available, inclusion: {in: [true, false]}
  validates :on_sale, inclusion: {in:[true, false]}

  belongs_to :category
  has_many   :reviews
  has_many   :order_products
  has_many   :orders, through: :order_products

  mount_uploader :image, ImageUploader

  def in_stock!
    ret_str = ""
    if !sold_out?
      ret_str = "In stock"
      ret_str += "; Only #{num_in_stock} items left !!" if num_in_stock < 5
    else
      ret_str ="Out of stock"
    end
    ret_str
  end

  def availability
    self.available ? "Available" : "Retired"
  end

  def sold_out?
    return true if num_in_stock == 0
  end

  
end
