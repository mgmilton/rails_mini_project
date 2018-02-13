Rails.application.routes.draw do
  root "welcome#index"

  resources :users, only: [:new, :create, :show] do
    resources :ideas
  end

  resources :categories do
    resources :ideas, only: [:new, :create, :show, :destroy, :update]
  end

  namespace :admin do
    resources :categories
  end

  resources :images, only: [:index, :new, :create, :show, :destroy]

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy"
end
