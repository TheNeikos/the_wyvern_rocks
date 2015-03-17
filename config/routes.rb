Rails.application.routes.draw do
  root 'index#dashboard'

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

  resources :dashboard_categories, only: [:show, :create, :update, :delete]
  namespace :admin do
    resources :global_settings, :only => [:index, :update]
    get '' => 'dashboard#index'
  end

  ##### USER PATHS
  devise_for :members, controllers: { sessions: "members/sessions", registrations: "members/registrations", omniauth_callbacks: 'omniauth_callbacks' }
  devise_scope :members do
    match 'member/:id', to: "member_pages#show", via: 'get', as: 'member_page'
    match 'all_members', to: "member_pages#index", via: 'get', as: 'all_members'
    match 'member/:id/finish_signup' => 'members_pages#finish_signup', via: [:get, :patch], :as => :finish_signup
  end
  ##### END USER PATHS
end
