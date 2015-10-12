Rails.application.routes.draw do
  root 'adventures#new'
  devise_for :users

  resources :bucket_lists
  patch '/bucket_lists/:id/edit', to: 'bucket_lists#update'

  resources :adventures, only: [:new, :create]
end
