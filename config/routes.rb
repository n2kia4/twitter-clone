Rails.application.routes.draw do
  devise_for :users

  resources :users, path: '/', only: [:show, :edit, :update]
  resources :tweets, only: [:create, :destroy]

  authenticated :user do
    root to: 'home#index', as: 'home'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
end
