class Order < ActiveRecord::Base
  belongs_to :user
  has_many   :order_products
  has_many   :products, through: :order_products

  def shipped?
    self.order_status == "shipped" ?  true : false
  end

  def total
     order_products.map(&:total).sum
  end

  def total_quantity
    order_products.map(&:quantity).sum
  end

  def total_in_cents
    (total * 100).to_i
  end

end
