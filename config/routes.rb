Rails.application.routes.draw do
  resources :auctions
  resources :cars, only: [:new, :create]
  resources :users
  resources :bids

  # root '/login'


  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  get '/users/:id/cars' => 'users#cars', as: 'user_cars'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
