class PagesController < ApplicationController
  def home
    @sample=Product.all.sample.pickRandom(4,Product)
  end
end
