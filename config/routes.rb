Rails.application.routes.draw do
  root 'index#dashboard'

  devise_for :users
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

  resources :users, :except => [:destroy] do
    collection do
      post 'login'
      post 'logout'
    end
  end

  resources :blogs do
    resources :blog_posts
  end

end
