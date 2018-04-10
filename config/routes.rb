Rails.application.routes.draw do
  devise_for :users
  # resources :users, only: [:edit, :update]
  resources :amenities
  resources :cities
  resources :amenity_rooms
  resources :bookings
  resources :reviews
  resources :rooms do
    resources :special_prices
  	collection do
    	get 'unauthorized'
      get 'room_owner'
  	end
  end
  #resources :special_prices
  root "rooms#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
