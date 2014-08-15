class OrderProductsController < ApplicationController
  def index
    @order = find_order
  end

  def show_order
    @order = find_order
  end

  def add_to_order
    # find product from params
    product = Product.find(params[:product_id])

    # find the order
    order = find_order

    # add to order
    order.order_products.create quantity: 1, product: product, price: product.price


    # redirect_to show cart page
    redirect_to show_order_path

  end

  def find_order
    if session[:order_id].present?
       order = Order.find(session[:order_id])
    else
      order = Order.create! order_status: "pending", user_id: current_user.id
      session[:order_id] = order.id
    end
    order
  end

  def update_order
    @order = find_order
    order_product = OrderProduct.find(params[:order_item_id])
    quantity = params[:order_product][:quantity].to_i
    if quantity == 0
      order_product.destroy
    else
      order_product.update(params.require(:order_product).permit(:quantity))
      order_product.save
    end
  end

  def cancel_order
    order = Order.find(params[:order_id])
    order.order_status = "cancelled"
    order.save
    session[:order_id] = nil
    redirect_to orders_path
  end

end
