Rails.application.routes.draw do
  devise_for :users
  get "home/about" => "homes#about", as: "about"
  root to: "homes#top"
  resources :books, only: [:about, :create, :index, :show, :edit, :destroy, :update]
  resources :users, only: [:show, :index, :edit, :update]
end
