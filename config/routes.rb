Rails.application.routes.draw do
  devise_for :users
  root to: "instruments#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :instruments

  resources :bookings, only: %i[index create show] do
    resources :reviews, only: %i[create]
  end
end
