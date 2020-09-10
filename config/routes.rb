Rails.application.routes.draw do
  get 'comments/new'
  devise_for :users
  root to: "items#index"
  resources :items do
    resources :transactions
    resources :comments, only: :create
  end
  resources :users
  
end
