Rails.application.routes.draw do
  ##### DASHBOARD PATHS
  root 'index#dashboard'
  resources :dashboard_categories, only: [:show, :create, :update, :delete]
  ##### END DASHBOARD PATHS

  ##### FORUM/BLOG PATHS
  resources :forums, only: [:show, :create, :update, :delete], shallow: true do
    resources :topics do
      resources :posts, only: [:new, :create, :edit, :update, :delete]
    end
  end
  resources :blogs do
    resources :blog_posts
  end
  ##### END FORUM/BLOG PATHS

  ##### ADMIN PATHS
  namespace :admin do
    resources :global_settings, :only => [:index, :update]
    get '' => 'dashboard#index'
  end
  ##### END ADMIN PATHS

  ##### USER PATHS
  devise_for :users, controllers: { sessions: "users/sessions", registrations: "users/registrations", omniauth_callbacks: 'omniauth_callbacks' }
  devise_scope :users do
    match 'user/:id', to: "user_pages#show", via: 'get', as: 'user_page'
    match 'all_users', to: "user_pages#index", via: 'get', as: 'all_users'
    match 'user/:id/finish_signup' => 'users_pages#finish_signup', via: [:get, :patch], :as => :finish_signup
  end
  ##### END USER PATHS
end
