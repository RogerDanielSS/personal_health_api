Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }

  resources :users
  resources :items
  resources :dynamic_fields
  resources :categories


  get 'my_items', action: :current_user_items, controller: 'items'
  get 'users/:user_id/items', action: :user_items, controller: 'items'
end
