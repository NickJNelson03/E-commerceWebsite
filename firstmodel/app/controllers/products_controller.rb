class ProductsController < ApplicationController
  def index
    @products = Product.all
    puts @products
    @products.each do |prod|
      puts prod.title
    end
  end
end
