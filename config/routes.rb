Rails.application.routes.draw do
  namespace :admin do
    resources :buckets  , only: [:new, :create, :edit, :update, :destroy]
    resources :galleries, only: [:update]
    get "/" => "administration#index"
  end
  resource :home, controller: :home, only: [] do
    get "index" => "home#index"
    get "terms" => "home#terms"
  end
  devise_for :users
  root 'home#index'
end
