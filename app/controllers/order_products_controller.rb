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
      order = Order.create!
      session[:order_id] = order.id
    end
    puts "session[:order_id]: #{session[:order_id]}"
    order
  end

  def update_order
    @order = find_order
    order_product = OrderProduct.find(params[:order_item_id])
    order_product.update(params.require(:order_product).permit(:quantity))
    order_product.save
  end

end
