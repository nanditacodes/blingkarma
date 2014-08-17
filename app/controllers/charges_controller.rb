class ChargesController < ApplicationController

  skip_before_filter :verify_authenticity_token, only: [:pay]

  respond_to :html, :json

  def pay

    @order = Order.find(session[:order_id])

    Stripe.api_key = "sk_test_VRhfdy1Van1gEZboNRG6kwtC"

    # Get the credit card details submitted by the form
    token = params[:stripeToken]

    # Create the charge on Stripe's servers - this will charge the user's card
    begin
      charge = Stripe::Charge.create(
        :amount => @order.total_in_cents, # amount in cents, again
        :currency => "usd",
        :card => token,
        :description => "Bling Karma"
      )
    rescue Stripe::CardError => e
      puts "card has been declined"
      # The card has been declined
    end

    # 1. create charge
    # 2. create order
    @order.stripe_charge_id = charge.id
    @order.order_status = "paid"
    @order.save

    # 3. remove cart
    session[:order_id] = nil

    # 4. update inventory
    @order.order_products.each do |op|
      op.product.update(num_in_stock: op.product.num_in_stock - op.quantity)
    end

    redirect_to order_invoice_path(stripe_charge_id: @order.stripe_charge_id)
    # redirect_to order_invoice_path(stripe_charge_id: @order.stripe_charge_id)
  end

  def invoice
    @order = Order.find_by stripe_charge_id: params[:stripe_charge_id]
  end

end
