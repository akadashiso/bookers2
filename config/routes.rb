Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :users
  get 'home/about' => 'homes#about'
  resources :homes, only: [:index]
  resources :users do
    resource :books, only: [:edit, :destroy]
  end
  resources :books, only: [:new, :create, :index, :show, :destroy]
  end
