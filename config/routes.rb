Rails.application.routes.draw do
  root "articles#index"
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destory'
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.m
  get "up" => "rails/health#show", as: :rails_health_check
  resources :articles
  resources :users

 
  # Defines the root path route ("/")
  # root "posts#index"
end
