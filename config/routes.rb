Rails.application.routes.draw do
  root 'articles#index'
  resources :sessions, only: [:new, :destroy]
  resources :users, except: [:index, :edit, :update]
end
