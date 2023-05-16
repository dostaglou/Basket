Rails.application.routes.draw do
  # Defines the root path route ("/")
  root "home#welcome"
  require "sidekiq/web"

  devise_for :users, controllers: { sessions: 'users/sessions' }

  patch 'baskets/:id/toggle_items', to: 'baskets#toggle_items', as: "toggle_items"
  resources :baskets
  resources :basket_items
end
