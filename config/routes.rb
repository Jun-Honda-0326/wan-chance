Rails.application.routes.draw do
  get 'likes/create'
  get 'likes/destroy'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: "posts#index"

  resources :posts, only: [:index, :new, :create, :show, :destroy] do
    resources :likes, only: [:create, :destroy] 
    resources :comments, only: :createl
    collection do
      get 'search'
    end
  end
  resources :users, only: :show
  resources :rooms, only: [:index,:create, :show] 
  resources :messages, only: :create
end