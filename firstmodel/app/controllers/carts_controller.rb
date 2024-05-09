class CartsController < ApplicationController
  before_action :authenticate_user!

  def show
    @cart = current_cart
  end

  private

  def current_cart
    Cart.find_or_create_by(user_id: current_user.id) if user_signed_in?
  end
end
