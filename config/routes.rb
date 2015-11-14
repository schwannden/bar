Rails.application.routes.draw do
  devise_for :users
  resource :home, controller: :home, only: [] do
    get "index" => "home#index"
    get "terms" => "home#terms"
  end
  root 'home#index'
end
