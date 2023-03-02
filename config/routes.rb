Rails.application.routes.draw do
  resources :flats
  devise_for :users
  root to: "instruments#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :instruments do
    resources :reviews, only: %i[create]
  end

  resources :bookings, only: %i[index create show]
end
