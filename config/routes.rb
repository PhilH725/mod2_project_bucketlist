Rails.application.routes.draw do
  resources :auctions
  #resources :cars
  resources :users

  root 'application#hello'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
