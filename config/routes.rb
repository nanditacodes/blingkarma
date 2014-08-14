Rails.application.routes.draw do


  get 'order_products/index'

  resources :products
  resources :orders
  resources :order_products

  devise_for :users

  root to: 'products#index'

  get 'account' => 'users#account', as: "account"
  get "edit" => "users#edit", as: :edit_user
  patch "update" => "users#update", as: :update_user


  

  get "/search" => "products#search", as: :search

  get "reviews/list/:product_id" => "reviews#list", as: :reviews
  post "reviews/create/:product_id" => "reviews#create", as: :create_review


  get "/cart" => "order_products#show_order", as: :show_order
  post "/add_to_cart/:product_id" => "order_products#add_to_order", as: :add_to_order
  patch "/update_cart/:order_item_id" => "order_products#update_order", as: :update_order


end
