Rails.application.routes.draw do

  devise_for :users
  root to: "homes#top"
  get "/homes/about" => "homes#about",as: "about"
  resources :books, only: [:edit,:index,:create,:show,:update,:destroy]
  resources :users, only: [:edit,:index,:show,:update,:create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
