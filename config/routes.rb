Rails.application.routes.draw do

  root 'breweries#index'
  resources :memberships
  resources :beer_clubs
  resources :users
  resources :beers
  resources :breweries
  resources :ratings, only: [:index, :new, :create, :destroy]
  resource :session, only: [:new, :create, :destroy]
  resources :places, only:[:index, :show]

  get 'signup', to: 'users#new', as: "signup"
  get 'signin', to: 'sessions#new', as: "signin"
  delete 'signout', to: 'sessions#destroy', as: "signout"
  get 'places', to: 'places#index'
  post 'places', to:'places#search'

end
