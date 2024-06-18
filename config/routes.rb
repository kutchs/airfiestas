Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"

  resources :events do
    resources :reservations, only: [:new, :create]
    member do
      post 'register'
    end
  end

  resources :reservations, only: [:index, :new, :update] do
    member do
      patch 'validate'
      get 'validate'
    end
  end

  get 'myevents', to: 'myevents#index', as: 'my_events'

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
