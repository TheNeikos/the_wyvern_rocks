Rails.application.routes.draw do
  get 'member_pages/index'

  get 'member_pages/show'

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
    match 'all_users', to: "user_pages#index", via: 'get', as: 'all_users'
  end
  devise_for :members, controllers: { sessions: "members/sessions", registrations: "members/registrations" }
  devise_scope :members do
    match 'member/:id', to: "member_pages#show", via: 'get', as: 'member_page'
    match 'all_members', to: "member_pages#index", via: 'get', as: 'all_members'
  end

end
