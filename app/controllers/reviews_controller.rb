class ReviewsController < ApplicationController
  before_action :set_reviews

  def list
    @review = Review.new
  end

  def create
    @review = @product.reviews.build(create_params)
    @review.rating = 0 if @review.rating.blank?
    @review.user_id = current_user.id
    @product.save

    @nz_reviews= Review.get_nz_reviews(@product.id)
    rating = @nz_reviews.count > 0 ? (@nz_reviews.map(&:rating).sum/@nz_reviews.count).to_i : 0
    @product.update(rating: rating)

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
