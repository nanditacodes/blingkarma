class User < ActiveRecord::Base
  validates :name, presence: true, on: [:update], if: Proc.new { |u| u.email != "admin@blingkarma.com" }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many  :orders
  has_many  :reviews

  def user_name
    name || email
  end

end
