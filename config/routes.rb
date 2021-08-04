Rails.application.routes.draw do
  resources :favourites
  resources :cats
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
