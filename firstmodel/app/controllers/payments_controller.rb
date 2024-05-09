class PaymentsController < ApplicationController

  def new
    @cart = current_cart # Ensure you have a method to fetch the current user's cart
    @total_amount = @cart.cart_items.sum do |item|
      item.quantity * item.product.price
    end
  end

  def create
    @cart = current_cart
    total_amount_cents = @cart.cart_items.sum do |item|
      item.quantity * item.product.price
    end * 100  # Convert dollars to cents for Stripe

    customer = Stripe::Customer.create(
      email: params[:stripeEmail],
      source: params[:stripeToken]
    )

    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: total_amount_cents,
      description: 'Product Description',
      currency: 'usd'
    })

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_payment_path
  end

end
