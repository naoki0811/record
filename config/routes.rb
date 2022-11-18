Rails.application.routes.draw do
  devise_for :users
  root to: "tweets#index"
  resources :tweets do
    resources :comments, only: [:destroy, :create]
    resources :favorites, only: [:create, :destroy]
  end

  resources :users, only:[:index, :show, :edit, :update]
end

