Rails.application.routes.draw do

  root "posts#index"

  resources :posts, only: [:index, :new, :create]

end
