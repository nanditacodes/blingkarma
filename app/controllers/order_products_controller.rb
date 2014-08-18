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
    # smart_cart - update quantity if same item is added.
    if (order.products.find_by(id: product.id))
      op = order.order_products.find_by(product_id: product.id)
      op.quantity += 1
      op.save
    else
      order.order_products.create quantity: 1, product: product, price: product.list_price
    end


    # redirect_to show cart page
    redirect_to show_order_path

  end

  def find_order
    if session[:order_id].present?
       order = current_user.orders.find(session[:order_id])
    else
      last_order = current_user.orders.last
      if last_order.order_status=='pending'
        order = last_order
        session[:order_id] = last_order.id
      else
        order =  current_user.orders.create! order_status: "pending"
        session[:order_id] = order.id
      end
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



end
