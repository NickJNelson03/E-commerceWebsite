class ProductsController < ApplicationController
  def index
    @products = Product.all
  end
  
  def show
    @product = Product.find(params[:id])
    @brand=Brand.find(@product.brand_id)
  end
end
