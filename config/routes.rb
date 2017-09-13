Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#index'
  resources :users, only: [:new, :create, :index, :show]

  resource :session, only: [:new, :create, :destroy]

  resources :words

  resources :searches, only: [:index, :show]
end
