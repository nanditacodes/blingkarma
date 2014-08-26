class ProductsController < ApplicationController
  before_action :set_category, only: [:new, :edit]
  before_action :set_product, only: [:show, :edit, :update]

  respond_to :html, :json

  def index
    if params[:search].present?
      @products = Product.blingsearch(params).where(available: true).order(:rating).page(params[:page]).per(9)
      respond_with @products
    else
      category_name = params[:category]
      on_sale = params[:sale]
      if on_sale.present?
        @products = Product.search_by_sale_and_available.sort_by_price_and_rating
      elsif category_name.present?
        cat_id = Category.find_by(name: params[:category])
        @products = Product.search_by_cat_and_available(cat_id).sort_by_price_and_rating
      else
        @products = Product.all.sort_by_price_and_rating
      end
      @products = @products.page(params[:page]).per(9)
    end
  end

  def edit
  end

  def show
  end

  def retire
    Product.where(id: params[:product_ids]).update_all(available: false)
    redirect_to admin_home_path
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
    params.require(:product).permit(:category_id, :title, :price, :list_price, :num_in_stock, :discount_percent,:image, :on_sale)
  end

  def set_category
    @category = Category.all
  end

  def set_product
    @product = Product.find(params[:id])
  end

end
