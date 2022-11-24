Rails.application.routes.draw do
  resources :actors
  resources :movies
  resources :logs
  
  resources :comments
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "movies#index"
end
