Rails.application.routes.draw do
  root 'articles#index'

  resources :articles do
    resources :article_versions, path: :versions, only: [:new, :edit, :update], as: :versions
  end

  resources :sessions, only: [:new, :create, :destroy]
  resources :users, except: [:index, :edit, :update]

end
