class User < ActiveRecord::Base
  validates :name, presence: true, on: [:update]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many  :orders
  has_many  :reviews

end
