class OrdersController < ApplicationController
  def index
    @orders = Order.where.not(order_status: 'pending')
  end

  def create
    @order = Order.create(order_status: "pending", user_id: current_user.id)
    session[:order_id] ||= @order.id
    redirect_to root_path
  end


end
