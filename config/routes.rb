Rails.application.routes.draw do
  root "welcome#index"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  resources :users, only: [:new, :create, :show]

  namespace :admin do
    resources :categories, only: [:index]
  end
end
