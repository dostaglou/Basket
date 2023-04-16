Rails.application.routes.draw do
  # Defines the root path route ("/")
  root "home#welcome"

  devise_for :users, controllers: { sessions: 'users/sessions' }

  resources :baskets
  resources :basket_items
  resources :items
end
