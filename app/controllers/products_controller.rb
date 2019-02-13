class ProductsController < ApplicationController

  def index
    @products = Product.all
    render 'index.html.erb'
  end

  def new
    render 'new.html.erb'
  end

end
  
  # def show
  #   @products = Product.find_by(params[:id])
  #   render 'show.html.erb'
  # end

  # def new
  #   render 'new.html.erb'
  # end


# def destroy
#   @Product = Product.find(params[:id])
#   @products.destroy
#   redirect_to "/products"
# end
