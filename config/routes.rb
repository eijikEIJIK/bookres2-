Rails.application.routes.draw do

  resources :users, only: [:index, :show, :edit, :update]

  devise_for :users
  root to: "homes#top"

  resources :books

  get '/homes/about', to: 'homes#about', as: 'about'
end
