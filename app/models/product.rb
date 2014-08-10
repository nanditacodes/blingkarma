class Product < ActiveRecord::Base
  before_validation   :calc_list_price

  validates :title, presence: true, uniqueness: true
  validates :price, numericality: { greater_than: 0 }
  validates :price, numericality: { greater_than: 0 }
  validates :available, inclusion: {in: [true, false]}
  validates :on_sale, inclusion: {in:[true, false]}

  belongs_to :category
  has_many   :reviews
  has_many   :order_products
  has_many   :orders, through: :order_products

  def available?
    if self.available
      return "In stock"
    else
      return "Out of stock"
    end
  end

  private
  def calc_list_price
    if self.discount_percent.to_f > 0
      self.list_price = self.price.to_f - (self.discount_percent.to_f/100 * self.price.to_f)
    else
      self.list_price = self.price
    end
    return self.list_price
  end

end
