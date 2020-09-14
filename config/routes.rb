Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  get 'comments/new'
  resources :items do
    resources :transactions
    resources :comments, only: :create
    collection do
      get 'search'
    end
  end
  resources :users
  
end
