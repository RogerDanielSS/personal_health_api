Rails.application.routes.draw do
  devise_for :users, skip: [:registrations]


  resources :users
  resources :items
  resources :dynamic_fields
  resources :categories
end
