class Product < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :price, numericality: { greater_than: 0 }
  validates :list_price, numericality: { greater_than: 0 }
  validates :available, inclusion: {in: [true, false]}
  validates :on_sale, inclusion: {in:[true, false]}

  belongs_to :category
  has_many   :reviews
  has_many   :order_products
  has_many   :orders, through: :order_products
end
