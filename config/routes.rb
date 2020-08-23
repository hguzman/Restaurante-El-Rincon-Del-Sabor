Rails.application.routes.draw do
  # namespace :categories do
  #   get 'dishes/index'
  #   get 'dishes/new'
  #   get 'dishes/create'
  #   get 'dishes/show'
  # end
  # resources :dishes
  resources :categories
  devise_for :users
  get 'home/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"

  resources :categories do
  resources :dishes, module: :categories

  end

end
