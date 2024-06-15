Rails.application.routes.draw do
  get 'reservations/new'
  patch 'reservations/update'
  get 'myevents/index'
  get 'events/index'
  get 'events/show'
  get 'events/new'
  get 'events/edit'
  get 'events/create'
  patch 'events/update'
  delete 'events/destroy'
  devise_for :users
  root to: "pages#home"
  resources :events do
    resources :reservations, only: [:new, :create]
  end

  get "myevents", to: "myevents#index"
  get "reservations", to: "reservations#index"
  patch "reservations/:id/validate", to: "reservations#validate"
  get "reservations/:id/validate", to: "reservations#validate"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
