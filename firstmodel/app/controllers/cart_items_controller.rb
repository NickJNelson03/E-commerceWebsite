class CartItemsController < ApplicationController
  def create
    @cart = current_cart
    @cart_item = @cart.cart_items.new(cart_item_params)
    @cart.save
    redirect_to cart_path(@cart)
  end

  def update
    @cart = current_cart
    @cart_item = @cart.cart_items.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_path(@cart)
  end

  def destroy
    @cart = current_cart
    @cart_item = @cart.cart_items.find(params[:id])
    @cart_item.destroy
    redirect_to cart_path(@cart)
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:product_id, :quantity)
  end

  # Assuming you have a method to find the current cart
  def current_cart
    Cart.find(session[:cart_id])
  end
end
