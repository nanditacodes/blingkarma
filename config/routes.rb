Rails.application.routes.draw do
  get 'users/edit'

  get 'users/update'

  devise_for :users

  root to: 'products#index'

  get "edit" => "users#edit", as: :edit_user
  patch "update" => "users#update", as: :update_user


end
