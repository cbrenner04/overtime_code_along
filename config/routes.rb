Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :posts
    resources :admin_users

    root to: "users#index"
  end

  resources :audit_logs, except: [:new, :edit, :destroy]
  resources :posts do
    get :approve, on: :member
  end
  devise_for :users, skip: [:registrations]
  root to: 'static#homepage'
end
