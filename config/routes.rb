Rails.application.routes.draw do
  resources :flats
  devise_for :users
  root to: "instruments#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :instruments do
    resources :reviews, only: %i[create]
    resources :bookings, only: %i[create]
  end

  resources :bookings
end
