class ProductsController < ApplicationController
  def index
    category_name = params[:category]
    on_sale = params[:sale]
    if on_sale.present?
      @products = Product.where(on_sale: true).page(params[:page]).per(10)
    elsif category_name.present?
      cat_id = Category.find_by(name: params[:category])
      @products = Product.where("category_id = ? and on_sale = ?", cat_id, false).page(params[:page]).per(10)
    else
      @products = Product.all.page(params[:page]).per(10)
    end
  end

  def show
    @product = Product.find(params[:id])
  end

end
