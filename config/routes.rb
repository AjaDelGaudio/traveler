Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users

  resources :bucket_lists, only: [:index, :new, :create]
end
