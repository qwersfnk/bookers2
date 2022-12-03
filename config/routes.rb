Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get 'home/about' => 'homes#about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :books, only: [:new, :index, :show, :destroy, :edit, :update, :create]
  resources :users, only: [:new, :index, :show, :destroy, :edit, :update]
end