class ProductsController < ApplicationController
  def index
    category_name = params[:category]
    if category_name.present?
      cat_id = Category.find_by(name: params[:category])
      @products = Product.where(category_id: cat_id).page(params[:page]).per(10)
    else
      @products = Product.all.page(params[:page]).per(10)
    end
  end
end
