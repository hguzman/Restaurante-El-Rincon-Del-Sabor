Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"
  resources :profiles
  resources :clients
  resources :sales
  resources :categories do
    resources :dishes, module: :categories
  end

  resources :sales do
    resources :sale_details, module: :sales
  end

  post '/search', to: 'search#results'
end
