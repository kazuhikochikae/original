Rails.application.routes.draw do
  get 'characters/show'
  devise_for :characters
  devise_for :users, controllers: { registrations: 'users/registrations' }
  get '/characters', to: 'characters#index'
  get 'relationships/create'
  get 'relationships/destroy'
  get 'users/show'
  
  resources :profiles
  resources :vr_people
  root 'users#show'

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  get "users/profile" => "users#show"

  resources :blogs do
    resources :comments
  end

  resources :conversations do
    resources :messages
  end

  resources :users, only: [:index] #resources :usersの項に[:index]のルーティングを追加する。

  resources :relationships, only: [:create, :destroy]

end

