Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
  root to: "home#index"

  resources :users
  resources :clients, except: :show
  resources :categories do
    resources :dishes, module: :categories, except: :show
  end

  resources :sales do
    resources :sale_details, module: :sales, except: :show
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
