Rails.application.routes.draw do
  root to: 'items#index'
  devise_for :users
  resources :items
  post 'items/new', to: 'items#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
