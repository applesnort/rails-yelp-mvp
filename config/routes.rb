Rails.application.routes.draw do
  get 'reviews/new'
  get 'restaurants', to: 'restaurants#index'
  get 'restaurants/new', to: 'restaurants#new', as: :new_restaurant
  get 'restaurants/:id', to: 'restaurants#show', as: :restaurant
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
