class ReviewsController < ApplicationController
  def list
    @product = Product.find(params[:product_id])
    @review = Review.new
  end

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.build(create_params)
    @review.user_id = current_user.id
    @review.save

    @product.rating = @product.reviews.average(:rating).to_i
    @product.save
  end

  private
  def create_params
    params.require(:review).permit(:body, :rating)
  end
end
