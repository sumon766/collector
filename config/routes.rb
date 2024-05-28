Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "home#index"

  # Other routes for the app
  resources :categories
  resources :tags
  resources :collections do
    resources :items do
      resources :comments, only: :create
      resource :like, only: [:create, :destroy]
    end
  end

  patch 'update_preferences', to: 'preference#update'
  get 'admin/index', to: 'admin#index'
  patch 'update_user_status/:id', to: 'admin#update_user_status', as: 'update_user_status'
  patch 'update_user_role/:id', to: 'admin#update_user_role', as: 'update_user_role'
  get 'admin/users/:id/collections', to: 'admin#user_collections', as: 'admin_user_collections'
  get 'admin/collections/:id/items', to: 'admin#collection_items', as: 'admin_collection_items'
end
