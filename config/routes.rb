Rails.application.routes.draw do
  namespace :admin do
    resources :bucket , only: [:new, :create, :edit, :update]
    get "/" => "administration#index"
  end
  resource :home, controller: :home, only: [] do
    get "index" => "home#index"
    get "terms" => "home#terms"
  end
  devise_for :users
  root 'home#index'
end
