class OrderProductsController < ApplicationController
  def index
    @order_products = OrderProduct.find_by(order_id: session[:order_id])
    p @order_products
  end
end
