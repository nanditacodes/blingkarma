class ProductsController < ApplicationController
  before_action :set_category, only: [:new, :edit]
  before_action :set_product, only: [:show, :edit, :update]

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
  end

  def show
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
    if @product = Product.create(prod_params)
      redirect_to admin_home_path
    else
      render :new
    end
  end

  def update
    if @product.update(prod_params)
      redirect_to admin_home_path
    else
      render :edit
    end
  end

  private
  def prod_params
    params.require(:product).permit(:category_id, :title, :price, :list_price, :num_in_stock, :discount_percent,:image)
  end

  def set_category
    @category = Category.all
  end

  def set_product
    @product = Product.find(params[:id])
  end

end
