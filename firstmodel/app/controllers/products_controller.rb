class ProductsController < ApplicationController
  def index
    @products = Product.all
  end
  
  def show
    @product = Product.find(params[:id])
    @brand=Brand.find(@product.brand_id)
    @reviews=@product.reviews
    @sample=@product.pickRandom(4,Product)
    @fakeuser=User.find(2)
  end

  def edit
    @product = Product.find(params[:id])
    @brands = Brand.all
  end

  def new
    @product = Product.new
    @brands = Brand.all
  end

  def create
    @product = Product.new(product_params)
    @brands = Brand.all
    
    if @product.save
      redirect_to @product
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    redirect_to products#index
  end
private  
  def product_params
    params.require(:product).permit( :title, :desc, :price, :stock, :brand_id, :user_id, :image)
  end

end
