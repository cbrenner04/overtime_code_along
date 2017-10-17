Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :posts
    resources :admin_users
    resources :employees

    root to: "users#index"
  end

  resources :audit_logs, except: [:new, :edit, :destroy] do
    get :confirm, on: :member
  end
  resources :posts do
    get :approve, on: :member
  end
  devise_for :users, skip: [:registrations]
  root to: 'static#homepage'
end
