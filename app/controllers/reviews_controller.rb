class ReviewsController < ApplicationController
  before_action :set_reviews

  def list
    @review = Review.new
  end

  def create
    @review = @product.reviews.build(create_params)
    @review.user_id = current_user.id
    @product.rating = @product.reviews.average(:rating).to_i
    @product.save
  end

  private
  def create_params
    params.require(:review).permit(:body, :rating)
  end

  def set_reviews
    @product = Product.find(params[:product_id])
    @reviews = @product.reviews.order("created_at desc")
  end
end
