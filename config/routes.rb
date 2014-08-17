Rails.application.routes.draw do

  get 'admin/index'

  get 'admin/show'

  get 'admin/edit'

  devise_for :users, controllers:  {registrations: "users/registrations", sessions: 'users/sessions'}


  get 'order_products/index'

  resources :products
  resources :orders do
    collection do
      patch :ship
    end
  end
  resources :order_products


  root to: 'products#index'

  get 'account' => 'users#account', as: :account
  get "edit" => "users#edit", as: :edit_user
  patch "update" => "users#update", as: :update_user

  post "/pay" => "charges#pay"
  get "order_invoice/:stripe_charge_id" => "charges#invoice", as: :order_invoice




  get "/search" => "products#search", as: :search

  get "reviews/list/:product_id" => "reviews#list", as: :reviews
  post "reviews/create/:product_id" => "reviews#create", as: :create_review


  get "cart" => "order_products#show_order", as: :show_order
  post "add_to_cart/:product_id" => "order_products#add_to_order", as: :add_to_order
  patch "update_cart/:order_item_id" => "order_products#update_order", as: :update_order
  patch "cancel_order/:order_id" => "order_products#cancel_order", as: :cancel_order

  get "admin_home" => "admin#index", as: :admin_home
  get "admin_order" => "admin#order_index", as: :admin_order


end
