Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  post "register", to: 'registrations#users_registration'
  post  "authenticate", to: 'users#authenticate_user'
  get 'logout', to: "users#logout"
  get 'items', to: "items#index"
  get 'users/:id', to: "users#show"
  patch 'update/:id', to: "users#update_details"
  put 'update/:id', to: "users#update_details"
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
