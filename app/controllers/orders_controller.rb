class OrdersController < ApplicationController
  def index
    @orders = current_user.orders.where.not(order_status: 'pending')
  end

  def ship
    Order.where(id: params[:order_ids]).update_all(order_status: 'shipped')
    redirect_to admin_order_path
  end

end
