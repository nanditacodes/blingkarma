class AdminController < ApplicationController
  before_action :set_orders, only: [:order_index, :order_charts]
  def index
    @products = Product.all.page(params[:page]).per(10)
  end

  def show
  end

  def edit
  end


  def order_index
  end

  def order_charts

    @my_array= []

    ["shipped", "paid", "pending", "cancelled"].each do |key|
      if @orders[key].present?
        @my_array << @orders[key].count
      else
        @my_array << 0
      end
    end
  end

  private
  def set_orders
    @orders = Order.all.group_by(&:order_status)
  end

end
