Rails.application.routes.draw do
  # STEP 1: A ROUTE triggers a controller action
  # verb "/urls" => "namespace/controllers#action"
  namespace :api do
    get "/products" => 'products#index'
    post "/products" => 'products#create'
    get "/products/:id" => 'products#show'
    patch "/products/:id" => 'products#update'
    delete "/products/:id" => 'products#destroy'

    post "/users" => "users#create"
    post "/sessions" => "sessions#create"

    get "/orders" => "orders#index"
    post "/orders" => "orders#create"
    get "/orders/:id" => "orders#show"

    get "/carted_products" => "carted_products#index"
    post "/carted_products" => "carted_products#create"
    delete "/carted_products/:id" => "carted_products#destroy"
  end
end

# The routes below were all tried by me prior but cleaned up with code from GitHub
# Rails.application.routes.draw do
#   # STEP 1: A ROUTE triggers a controller action
#   # verb "/urls" => "namespace/controllers#action"
#   namespace :api do
#     get "/products" => 'products#index'
#     post "/products" => 'products#create'
#     get "/products/:id" => 'products#show'
#     patch "/products/:id" => 'products#update'
#     delete "/products/:id" => 'products#destroy'

#     post "/users" => "users#create"
#     post "/sessions" => "sessions#create"

#     get "/orders" => "orders#index"
#     post "/orders/:id" => "orders#create"
#     get "/orders/:id" => "orders#show"



#     get "/carted" => "carted_products#index"
#     post "/carted" => "carted_products#create"
#     delete "/carted/:id" => "carted_products#destroy"
#   end

#     get "/products" => "items#index"
#     get "/products/new" => "products#new"
#     get "/products/:id" => "items#show" #make sure to list these in the correct order on both the routes page and the controller page

# end


    # get "/suppliers" => 'products#index'
    # post "/suppliers" => 'supplies#create'
    # get "/suppliers/:id" => 'products#show'
    # patch "/suppliers/:id" => 'products#update'
    # delete "/suppliers/:id" => "products#destroy"