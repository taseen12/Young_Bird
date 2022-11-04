Rails.application.routes.draw do
  get 'my_bookings/index'
  get 'user_rooms/index'
  get 'package_details/index'
  get 'user_hotels/index'
  get 'user_places/index'
  get 'user_packages/index'
  get 'search', to: "user_place#search"
  get 'bookings/done'
  resources :packages
  resources :bookings
  resources :rooms
  resources :hotels
  resources :places
  root to: 'home#index'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
