class User < ApplicationRecord
  has_many :brands
  has_one :cart

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # Additional code will go here once you generate Devise configurations

  def create_cart
    build_cart.save unless cart
    cart
  end
end
