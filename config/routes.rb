Rails.application.routes.draw do
  resource :home, controller: :home, only: [] do
    get "index" => "home#index"
    get "terms" => "home#terms"
  end
  devise_for :users
  root 'home#index'
end
