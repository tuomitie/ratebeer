Rails.application.routes.draw do
  resources :memberships
  resources :beer_clubs
  resources :users
  root 'breweries#index'
  resources :beers
  resources :breweries
  resources :ratings, only: [:index, :new, :create, :destroy]
  resource :session, only: [:new, :create, :destroy]

  get 'signup', to: 'users#new', as: "signup"
  get 'signin', to: 'sessions#new', as: "signin"
  delete 'signout', to: 'sessions#destroy', as: "signout"

end
