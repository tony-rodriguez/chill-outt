Rails.application.routes.draw do

  resources :articles do
    resources :article_versions, path: :versions, only: [:new, :edit, :update], as: :versions
  end

end
