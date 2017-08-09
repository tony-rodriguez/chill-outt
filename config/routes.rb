Rails.application.routes.draw do
  root 'articles#index'
  resources :users, except: [:index, :edit, :update]
end
