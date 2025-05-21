Rails.application.routes.draw do
  get 'api_v1_movies/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :movies, only: [:index, :create]
      post '/login', to: 'sessions#create'
      get 'session', to: 'sessions#show'
      get 'movies', to: 'movies#index'
    end
  end

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  # Defines the root path route ("/")
  # root "posts#index"
end
