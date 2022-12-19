Rails.application.routes.draw do
  devise_for :users
  get "homes/about" => "homes#about", as: "about"
  root to: "homes#top"
  resources :books, only: [:new, :create, :index, :show, :edit, :destroy, :update]
  resources :users, only: [:show, :index, :edit]
end
