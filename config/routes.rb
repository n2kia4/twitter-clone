Rails.application.routes.draw do
  devise_for :users

  resources :users, path: '/',
                    param: :username,
                    only: [:show, :edit, :update] do
    member do
      get :following, :followers
    end
  end

  resources :tweets, only: [:create, :destroy] do
    resource :likes, only: [:create, :destroy]
  end

  resources :relationships, only: [:create, :destroy]

  authenticated :user do
    root to: 'home#index', as: 'home'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
end
