Rails.application.routes.draw do
  get 'profiles/show'

  devise_for :users
  get 'welcome/index'

  resources :jobs do
  	resources :profiles
  end

  authenticated :user do
    root 'jobs#index', as: "authenticated_root"
  end

  root 'welcome#index'


end
