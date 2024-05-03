class ProductsController < ApplicationController
  def index
    @products = Product.all
  end
  
  def show
    @product = Product.find(params[:id])
    @brand=Brand.find(@product.brand_id)
    @reviews=@product.reviews
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    
    if @product.save
      redirect_to @product
    else
      render :new, status: :unprocessable_entity
    end
  end

  def product_params
    params.require(:product).permit( :title, :desc, :price, :stock, :brand_id, :image)
  end

end
