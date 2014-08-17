class AdminController < ApplicationController
  def index
    @products = Product.all.page(params[:page]).per(10)
  end

  def show
  end

  def edit
  end


  def order_index
    @orders = Order.all.group_by(&:order_status)
  end
end
