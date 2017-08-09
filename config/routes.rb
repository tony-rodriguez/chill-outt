Rails.application.routes.draw do
  root 'articles#index'
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, except: [:index, :edit, :update]
end
