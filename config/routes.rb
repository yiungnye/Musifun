Rails.application.routes.draw do
  get 'instruments/index'
  get 'instruments/show'
  get 'instruments/new'
  get 'instruments/create'
  devise_for :users
  root to: "instruments#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
