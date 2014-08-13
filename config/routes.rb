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


end
