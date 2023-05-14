Rails.application.routes.draw do
  # Defines the root path route ("/")
  root "home#welcome"

  devise_for :users, controllers: { sessions: 'users/sessions' }

  patch 'baskets/:id/toggle_items', to: 'baskets#toggle_items', as: "toggle_items"
  resources :baskets
  post 'items/:id/increment', to: 'items#increment', as: :increment_item
  resources :basket_items
  resources :items
end
