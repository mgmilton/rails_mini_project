Rails.application.routes.draw do
  root "welcome#index"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

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
end
