Rails.application.routes.draw do
  root 'breweries#index'
  resources :beers
  resources :breweries
  resources :ratings, only: [:index, :new, :create, :destroy]

  get 'kaikki_bisset', to: 'beers#index'
end
