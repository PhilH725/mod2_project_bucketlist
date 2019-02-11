Rails.application.routes.draw do
  resources :auctions
  resources :cars, only: [:new, :create]
  resources :users

  root 'application#hello'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'

  get '/users/:id/cars' => 'users#cars', as: 'user_cars'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
