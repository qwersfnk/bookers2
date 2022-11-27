Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :books, only: [:new, :index, :show, :destroy, :edit, :update]
  resources :users, only: [:new, :index, :show, :destroy, :edit, :update]
end