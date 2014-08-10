class OrderProduct < ActiveRecord::Base
  before_create   :set_line_total

  belongs_to :order
  belongs_to :product

  private
  def set_line_total
    self.line_total = self.price * self.quantity
  end
  
end
