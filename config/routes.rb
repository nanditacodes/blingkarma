Rails.application.routes.draw do

  resources :products

  get 'users/edit'

  get 'users/update'

  devise_for :users



  root to: 'products#index'

  get 'account' => 'users#account', as: "account"
  get "edit" => "users#edit", as: :edit_user
  patch "update" => "users#update", as: :update_user

  get "/search" => "products#search", as: :search


end
