Rails.application.routes.draw do

  devise_for :users
  root to: "homes#top"

  resources :post_books, only: [:new, :create, :index, :show, :edit]

  get '/homes/about', to: 'homes#about', as: 'about'
end
