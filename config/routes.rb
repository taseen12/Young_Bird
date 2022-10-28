Rails.application.routes.draw do
  get 'user_hotel/index'
  get 'user_place/index'
  get 'user_package/index'
  resources :packages
  resources :rooms
  resources :hotels
  resources :places
  root to: 'home#index'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
