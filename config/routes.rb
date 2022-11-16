Rails.application.routes.draw do
  get 'payment_histories/index'
  get 'my_bookings/index'
  get 'user_rooms/index'
  get 'package_details/index'
  get 'user_hotels/index'
  get 'user_places/index'
  get 'user_packages/index'
  get 'user_packages/details'
  get 'user_packages/filter'
  get 'search', to: "user_places#search"
  get 'filter_room', to: "user_rooms#filter_room"
  get 'filters_room', to: "user_packages#filters_room"
  get 'bookings/done'
  get 'payment_histories/done'
  get 'rooms/justshow'
  resources :packages
  resources :bookings
  resources :payment_histories
  resources :rooms
  resources :hotels
  resources :places
  root to: 'home#index'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
