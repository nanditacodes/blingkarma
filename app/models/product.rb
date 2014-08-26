class Product < ActiveRecord::Base

  include PgSearch
  pg_search_scope :search,
                  :against => :title,
                  :using => {
                    :tsearch => {
                      :prefix => true,
                      :dictionary => "english"
                      }
                    }


  validates :title, presence: true, uniqueness: true, on: [:create]
  validates :price, numericality: { greater_than: 0 }
  validates :list_price, numericality: { greater_than: 0 }
  validates :available, inclusion: {in: [true, false]}
  validates :on_sale, inclusion: {in:[true, false]}

  scope :search_by_sale_and_available, -> {where(on_sale:true, available: true)}
  scope :search_by_cat_and_available, -> (cat_id) {where('category_id = ? and available = ?', cat_id, true)}
  scope :sort_by_price_and_rating, -> {order(:list_price, rating: :desc)}

  belongs_to :category
  has_many   :reviews
  has_many   :order_products
  has_many   :orders, through: :order_products

  mount_uploader :image, ImageUploader

  def in_stock!
    ret_str = ""
    if !sold_out?
      ret_str = "In stock"
      ret_str += "; Only #{num_in_stock} items left !!" if num_in_stock < 5
    else
      ret_str ="Out of stock"
    end
    ret_str
  end

  def availability
    self.available ? "Available" : "Retired"
  end

  def sold_out?
    return true if num_in_stock == 0
  end

  def self.blingsearch(params)
    if params[:search].blank?
      Product.all
    else
      Product.search(params[:search])
    end
  end

end
