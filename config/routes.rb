Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  authenticate :user do
    resources :posts, only: [:new, :create, :edit, :update, :destroy]
  end
  resources :posts, only: [:index, :show]

  namespace :admin do
    resources :users
  end
  root "posts#index"
end
