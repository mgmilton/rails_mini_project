Rails.application.routes.draw do
  root "welcome#index"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  resources :users, only: [:new, :create, :show]
  resources :ideas
  resources :categories do
    resources :ideas, only: [:new, :create, :show, :destroy, :update]
  end

  namespace :admin do
    resources :categories, only: [:index]
  end
end
