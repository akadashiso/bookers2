Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :users
  get 'home/about' => 'homes#about'
  resources :homes, only: [:index]
  resources :users
  resources :books
  end
