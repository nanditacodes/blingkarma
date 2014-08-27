
class OrdersController < ApplicationController
  def index
    @orders = current_user.orders.where.not(order_status: 'pending').order(updated_at: :desc)
  end

  def ship
    Order.where(id: params[:order_ids]).update_all(order_status: 'shipped')


    account_sid = ENV["TWILIO_ACCOUNT_SID"]
    auth_token = ENV["TWILIO_AUTH_TOKEN"]

    # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new account_sid, auth_token

    params[:order_ids].each do |oid|
      user_id = Order.find(oid).user_id
      if user_id.present? && (user_phone_number = User.find(user_id).phone_number).present?
        order_deets = OrderProduct.where(order_id: oid)
        product_str = order_deets.map(&:product).map(&:title).join(",")
        @client.account.messages.create({
          from: '+12625814508',
          to:   "+1#{user_phone_number}",
          body: "Dear customer - Your order id #{oid} with the following items: #{product_str} has been shipped. Thank you for shopping with Bling Karma",
        })
      end
    end

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

  def show
    @order = Order.find(params[:id])
  end

end
