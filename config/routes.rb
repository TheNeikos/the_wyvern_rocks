Rails.application.routes.draw do
  root 'index#dashboard'

  resources :forums, only: [:show, :create, :update, :delete], shallow: true do
    resources :topics do
      resources :posts, only: [:new, :create, :edit, :update, :delete]
    end
  end

  resources :dashboard_categories, only: [:show, :create, :update, :delete]

  namespace :admin do
    resources :global_settings, :only => [:index, :update]
    get '' => 'dashboard#index'
  end

  resources :blogs do
    resources :blog_posts
  end

  ##### USER PATHS
  devise_for :users, controllers: { sessions: "users/sessions", registrations: "users/registrations" }
  devise_scope :users do
    match 'user/:id', to: "user_pages#show", via: 'get', as: 'user_page'
    match 'members', to: "user_pages#index", via: 'get', as: 'all_users'
  end

end
