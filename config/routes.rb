Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  devise_for :users, controllers: { registrations: 'users/registrations' }
  
  get 'users/show'

  # devise_scope :user do
  #   root "users/sessions#new"
  # end

  root "users#show"
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
    post 'users/guest_admin_sign_in', to: 'users/sessions#guest_admin_sign_in'
  end
  
  
  resources :profiles
  resources :vr_people

  get "users/profile" => "users#show"

  resources :conversations do
    resources :messages
  end

  resources :users, only: [:index] #resources :usersの項に[:index]のルーティングを追加する。

end

