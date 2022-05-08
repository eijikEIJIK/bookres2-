Rails.application.routes.draw do

  devise_for :users
  root to: "homes#top"
  resources :users, only: [:index, :show, :edit, :update]
  resources :books, only: [:create, :index, :show, :edit, :update, :destroy] do
    resources :book_comments, only: [:create,:destroy]
  end

  get '/home/about', to: 'homes#about', as: 'about'
end
