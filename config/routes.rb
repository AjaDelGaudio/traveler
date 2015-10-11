Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users

  resources :bucket_lists, only: [:index, :new, :create, :edit, :delete, :destroy]

  patch '/bucket_lists/:id/edit', to: 'bucket_lists#update'
end
