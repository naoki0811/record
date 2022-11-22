Rails.application.routes.draw do
  devise_for :users
  root to: "tweets#index"
  resources :tweets do
    resources :comments, only: [:destroy, :create]
    resource :favorites, only: [:create, :destroy]
    collection do
      get 'search'
    end
  end

  resources :users, only:[:index, :show, :edit, :update] do
    member do
      get :follows, :followers
    end
    resource :relationships, only: [:create, :destroy]
  end
end

