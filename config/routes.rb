Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
  root to: "home#index"

  resources :users
  resources :clients
  resources :categories do
    resources :dishes, module: :categories
  end

  resources :sales do
    resources :sale_details, module: :sales
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
