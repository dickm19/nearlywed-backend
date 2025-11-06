Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :users, only: [ :create, :show, :index, :update ]
  resources :weddings, only: [ :create, :show, :update ]

  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/logged_in", to: "sessions#is_logged_in?"

  patch "/weddings/:id/invite_guests", to: "weddings#invite_guests"

  mount ActiveStorage::Engine => "/rails/active_storage"
end
