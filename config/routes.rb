Rails.application.routes.draw do
  devise_for :users

  authenticated :user do
    root to: 'home#index', as: 'home'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
end
