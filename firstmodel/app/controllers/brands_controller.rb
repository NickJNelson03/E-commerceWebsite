class BrandsController < ApplicationController
  def index
    @brands=Brand.all
  end

  def show
    @brand = Brand.find(params[:id])
  end

  def create
    @brand = Brand.new
  end

  def new 
    @brand = Brand.new(brand_params)

    if @brand.save
      redirect_to @brand
    else
      render :new, status: :unprocessable_entity
    end
  end

  def brand_params
    params.require(:product).permit( :name, :desc, :image, :owner)
  end   
end
