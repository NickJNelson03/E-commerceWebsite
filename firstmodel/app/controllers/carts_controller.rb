class CartsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cart_item, only: [:destroy]

  def show
    @cart = current_cart
  end

  def destroy
    if @cart_item.destroy
      redirect_to cart_path, notice: 'Item was successfully removed from your cart.'
    else
      redirect_to cart_path, alert: 'Failed to remove the item.'
    end
  end

  private

  def current_cart
    Cart.find_or_create_by(user_id: current_user.id) if user_signed_in?
  end

  def set_cart_item
    @cart_item = CartItem.find(params[:id])
  end


end
