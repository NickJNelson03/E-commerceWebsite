# app/controllers/cart_items_controller.rb
class CartItemsController < ApplicationController
  before_action :set_cart_item, only: [:update, :destroy]

  def create
    @cart = current_cart
    product = Product.find(cart_item_params[:product_id])
    @cart_item = @cart.add_product(product.id, cart_item_params[:quantity])

    if @cart_item.save
      redirect_to cart_path, notice: 'Product added to cart.'
    else
      redirect_to products_url, alert: 'Unable to add product.'
    end
  end

  def update
    if @cart_item.update(cart_item_params)
      redirect_to cart_path, notice: 'Cart item was successfully updated.'
    else
      redirect_to cart_path, alert: 'Error updating cart item.'
    end
  end

  def destroy
    @cart_item.destroy
    redirect_to cart_path, notice: 'Cart item was successfully removed.'
  end

  private

  def set_cart_item
    @cart_item = CartItem.find(params[:id])
  end

  def cart_item_params
    params.require(:cart_item).permit(:product_id, :quantity)
  end

  def current_cart
    Cart.find(session[:cart_id])  # This needs to be defined based on how you handle carts in your app
  end
end
