Rails.application.routes.draw do
  devise_for :users
  root to: "instruments#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :instruments do
    resources :reviews, only: %i[new create]
  end

  resources :bookings, only: %i[new create show]
end
