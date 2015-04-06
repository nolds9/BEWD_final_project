Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'

  resources :jobs

  authenticated :user do
    root 'jobs#index', as: "authenticated_root"
  end

  root 'welcome#index'


end
