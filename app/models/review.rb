class Review < ActiveRecord::Base
  belongs_to :product
  belongs_to :user

  scope :get_nz_reviews, -> (product_id){where.not(rating: 0).where(product_id: product_id)}
end
