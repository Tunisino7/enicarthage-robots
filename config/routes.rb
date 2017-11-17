Rails.application.routes.draw do
  get 'admin/dashboard'

  resources :sessions, only: [:new, :create, :destroy]
  get 'signup', to: 'teams#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'myteam' => 'sessions#index'
  get 'payment' => 'sessions#payment'
  post 'payment' => 'sessions#payment'

  resources :teams
  get 'page/index'
  root 'page#index'
  get 'admin/dashboard' => 'admin#dashboard'
  post 'admin/dashboard' => 'admin#dashboard'
  post 'admin/dashboard' => 'admin#update'

  get 'admin' => 'admin#login'
  post 'admin/login' => 'admin#check'
end
