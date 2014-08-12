class Order < ActiveRecord::Base
  belongs_to :user
  has_many   :order_products
  has_many   :products, through: :order_products

  def shipped?
    self.order_status == "shipped" ?  true : false
  end

end
