Rails.application.routes.draw do
  resources :auctions
  resources :cars
  resources :users
  resources :bids

  # root '/login'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'application#logout'
  get '/verify' => 'application#verify'
  post '/logout' => 'sessions#destroy'

  get '/users/:id/cars' => 'users#cars', as: 'user_cars'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
