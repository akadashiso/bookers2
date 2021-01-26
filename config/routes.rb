Rails.application.routes.draw do
  devise_for :users
  resources :users
  root to: 'homes#index'
  get 'home/about' => 'homes#about'
  resources :homes, only: [:index]
  resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  end
