class CartItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cart_item, only: [:update, :destroy]

  def create
    @cart = current_cart
    product = Product.find_by(id: cart_item_params[:product_id])
    unless product
      redirect_to products_url, alert: 'Product not found.'
      return
    end

    @cart_item = @cart.add_product(product.id, cart_item_params[:quantity])
    if @cart_item && @cart_item.save
      redirect_to cart_path(@cart), notice: 'Product added to cart.'
    else
      redirect_to products_url, alert: 'Unable to add product. Exceeds available stock.'
    end
  end

  def update
    if @cart_item.update(cart_item_params)
      redirect_to cart_path(@cart), notice: 'Cart item was successfully updated.'
    else
      redirect_to cart_path(@cart), alert: 'Error updating cart item. Exceeds available stock.'
    end
  end

  def destroy
    @cart_item.destroy
    redirect_to cart_path(@cart), notice: 'Cart item was successfully removed.'
  end

  private

  def set_cart_item
    @cart_item = CartItem.find(params[:id])
  end

  def cart_item_params
    params.require(:cart_item).permit(:product_id, :quantity)
  end

  def current_cart
    user_signed_in? ? current_user.cart : nil
  end
end
