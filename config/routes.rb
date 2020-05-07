Rails.application.routes.draw do
  devise_for :users
  root "posts#index"

  resources :posts, only: [:index, :new, :create, :show] do
    resources :comments, only: :create
  end
  # resources :users, only: :show
end
