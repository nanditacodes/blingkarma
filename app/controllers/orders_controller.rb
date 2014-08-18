class OrdersController < ApplicationController
  def index
    @orders = current_user.orders.where.not(order_status: 'pending')
  end

  def ship
    Order.where(id: params[:order_ids]).update_all(order_status: 'shipped')
    redirect_to admin_order_path
  end

  def cancel
    order = current_user.orders.find(params[:id])
    order.order_status = "cancelled"
    # 4. update inventory
    order.order_products.each do |op|
      op.product.update(num_in_stock: op.product.num_in_stock + op.quantity)
    end
    order.save
    redirect_to orders_path
  end

end
