Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users

  resources :bucket_lists do
    collection do
      get 'all_public'
    end
  end

  resources :bucket_list_adventures, only: [:update, :edit]

  patch '/bucket_lists/:id/edit', to: 'bucket_lists#update'

  resources :adventures, only: [:new, :create, :index, :destroy]

  patch '/adventures/:id/edit', to: 'adventures#update'

  resources :adventures do
    collection do
      get "search"
    end
  end
end
