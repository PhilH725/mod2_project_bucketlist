Rails.application.routes.draw do
  resources :auctions
  resources :cars, only: [:new, :create]
  resources :users
  resources :bids

  # root '/login'

  get '/login' => 'sessions#new', as: 'login'
  post '/login' => 'sessions#create'
  get '/logout' => 'application#logout', as: 'logout'
  get '/verify' => 'application#verify'
  post '/logout' => 'sessions#destroy'

  get '/users/:id/cars' => 'users#cars', as: 'user_cars'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
