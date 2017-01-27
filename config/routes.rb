Rails.application.routes.draw do
  root 'breweries#index'
  resources :beers
  resources :breweries
  get 'kaikki_bisset', to: 'beers#index'
  get 'ratings', to: 'ratings#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
