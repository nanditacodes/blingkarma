class OrdersController < ApplicationController
  def index
    @orders = Order.where.not(order_status: 'pending')
  end

  
end
