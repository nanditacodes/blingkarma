class ProductsController < ApplicationController
  before_action :set_category, only: [:new, :edit]

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
    @products = @products.where(available: true)
  end

  def edit
    @product = Product.find(params[:id])
  end

  def show
    @product = Product.find(params[:id])
  end

  def retire
    Product.where(id: params[:product_ids]).update_all(available: false)
    redirect_to admin_home_path
  end

  def search
    puts params[:search]
    @products = Product.where("title ilike ?", "%#{params[:search]}%").page(params[:page]).per(10)
    render 'products/index'
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(prod_params)
    if @product.save
      redirect_to admin_home_path
    else
      render new_product_path
    end
  end

  private
  def prod_params
    params.require(:product).permit(:category_id, :title, :price, :list_price, :num_in_stock, :image)
  end

  def set_category
    @category = Category.all
  end

end
