Rails.application.routes.draw do


  get '/auctions/:id/bids/new', to: "bids#new", as: 'bid_new'
  get '/auctions/:id/bids/create', to: "bids#create"
  get '/auctions/:id/end', to: 'auctions#end', as: 'end'

  resources :auctions
  resources :cars, only: [:new, :create]
  resources :users
  resources :bids
  resources :feedbacks, only: [:new, :create, :show]

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  get '/users/:id/cars' => 'users#cars', as: 'user_cars'
  get '/users/:id/auctions' => 'users#auctions', as: 'user_auctions'
  get '/users/:id/feedbacks' => 'users#feedbacks', as: 'user_feedbacks'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
