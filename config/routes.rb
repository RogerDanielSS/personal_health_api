Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }


  resources :users
  resources :items
  resources :dynamic_fields
  resources :categories
end
