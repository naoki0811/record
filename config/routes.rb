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

  resources :users, only:[:show, :edit, :update] do
    member do
      get :follows, :followers
    end
    member do
      get :favorites
    end
    resource :relationships, only: [:create, :destroy]
  end

  namespace :api, format: :json do
    namespace :v1 do
      post '/tweets/preview', to: 'tweets#preview'
    end
  end
end

