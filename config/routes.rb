Rails.application.routes.draw do
  devise_for :users
  # resources :users, only: [:edit, :update]
  resources :amenities
  resources :cities
  resources :amenity_rooms
  resources :bookings
  resources :rooms do
  	collection do
    	get 'unauthorized'
      get 'room_owner'
 	end
  end
  root "rooms#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
