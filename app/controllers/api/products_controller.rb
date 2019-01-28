Skip to content
 
Search or jump to…

Pull requests
Issues
Marketplace
Explore
 @kcallawayworks Sign out
1
0 0 codelander-actualize/mini-capstone
 Code  Issues 0  Pull requests 0  Projects 0  Wiki  Insights
mini-capstone/app/controllers/api/products_controller.rb
3391a5a  3 days ago
@danizaghian danizaghian adds active record queries to index action
     
77 lines (63 sloc)  1.74 KB
class Api::ProductsController < ApplicationController

  def index
    @products = Product.all

    search_term = params[:search]
    if search_term
      @products = Product.where("name LIKE ?", "%#{search_term}%")
    end

    discount = params[:discount]
    if discount
      @products = Product.where("price < ?", 10)
    end

    sort_term = params[:sort]
    sort_order = params[:sort_order]
    
    if sort_term == "price"
      if sort_order == "desc"
        @products = @products.order(price: :desc)
      else
        @products = @products.order(:price)
      end
    else
      @products = @products.order(:id)
    end

    render 'index.json.jbuilder'
  end

  def create
    @product = Product.new(
      name: params[:name],
      price: params[:price],
      description: params[:description],
      image_url: params[:image_url]
    )
    if @product.save
      # happy path
      render 'show.json.jbuilder'
    else
      # sad path
      render json: {errors: @product.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def show
    @product = Product.find(params[:id])
    render 'show.json.jbuilder'
  end

  def update
    @product = Product.find(params[:id])
    
    @product.name = params[:name] || @product.name
    @product.price = params[:price] || @product.price
    @product.description = params[:description] || @product.description
    @product.image_url = params[:image_url] || @product.image_url

    if @product.save
      # happy path
      render 'show.json.jbuilder'
    else
      # sad path
      render json: {errors: @product.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    render json: {message: "Product successfully destroyed"}
  end

end

#will be updating with my own code, had to restore to get working copy


# class Api::ProductsController < ApplicationController

#   search_term = params[:search]

#   def index
#     @products = Products.where(id: :desc)
#     render 'validation.json.jbuilder'
#   end

  # def validator
  #   if @product.save
  #     render 'validator.json.jbuilder'
  #   else
  #     render json: {error: @product.errors.full_messages}, status: :unprocessbale_entity
  #   end
# end




# Inside your mini-capstone, add the following features:
# - Change the index action to return products sorted by id by default.

#   search_term = params[:search]
#     @products = Products.where(id: :desc)
#     render 'validation.json.jbuilder'

# - Change the index action to allow for searching by name (using params “search”).
# - Change the index action to allow the user to see products in order of price, lowest to highest (using params “sort” equal to “price”).
# - Change the index action to allow the user to see products in order of price, highest to lowest (using params “sort” equal to “price” and params “sort_order” equal to “desc”).
# - Change the index action to allow the user to display all products under $2.00 or some other price of your choosing (using params “discount” equal to “true”).

# To test out these features, you can use Insomnia, or you can use the frontend at https://mini-capstone.netlify.com/#/active-record-queries/products. If the frontend isn’t working, double check that your params match the ones being used on the frontend!



  # def create
  #   @product = Product.new(
  #     name: params[:name],
  #     price: params[:price],
  #     description: params[:description],
  #     image_url: params[:image_url]
  #   )
  #   @product.save
  #   render 'show.json.jbuilder'
  # end

  # def show
  #   @product = Product.find(params[:id])
  #   render 'show.json.jbuilder'
  # end

  # # def update
  # #   @product = Product.find(params[:id])
    
  # #   @product.name = params[:name] || @product.name
  # #   @product.price = params[:price] || @product.price
  # #   @product.description = params[:description] || @product.description
  # #   @product.image_url = params[:image_url] || @product.image_url

  #   @product.save
  #   render 'show.json.jbuilder'
  # end

  # # def destroy
  # #   @product = Product.find(params[:id])
  # #   @product.destroy
  # #   render json: {message: "Product successfully destroyed"}
  # # end

end
