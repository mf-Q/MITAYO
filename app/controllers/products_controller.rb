class ProductsController < ApplicationController

  def index
  end

  def new
    
  end

  def create
    Product.create(product_params)
  end



  private
  def product_params
    params.require(:product).permit(:title, :genre, :timing, :place, :number, :content, :user_id )
  end
end
