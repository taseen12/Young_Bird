Rails.application.routes.draw do
  get 'video_tours/index'
  # resources :blogs
  get 'contacts/index'
  get 'payment_histories/index'
  get 'my_bookings/index'
  get 'user_rooms/index'
  get 'package_details/index'
  get 'user_hotels/index'
  get 'user_hotels/details'
  get 'user_places/index'
  get 'user_packages/index'
  get 'user_packages/details'
  get 'user_packages/filter'
  get 'video_tours/index'
  get 'video_tours/details'
  get 'blogs/blog_details'
  get 'details', to: "user_hotels#details"
  post 'rating', to: "user_hotels#set_hotel_rating"
  get 'search', to: "user_places#search"
  get 'filter_room', to: "user_rooms#filter_room"
  get 'min_max', to: "user_rooms#min_max"
  get 'filters_room', to: "user_packages#filters_room"
  get 'bookings/done'
  get 'contacts/done'
  get 'payment_histories/done'
  get 'rooms/justshow'
  get 'blogs/my_blog'
  resources :packages
  resources :bookings
  resources :contacts
  resources :payment_histories
  resources :rooms
  resources :hotels
  resources :places
  devise_for :users
  root to: 'home#index'

  # scope module: "users" do
  resources :blogs
  # end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
