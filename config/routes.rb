Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 devise_for :users

  get "homes/top"
  get "home/about"=>"homes#about"
  root to:'homes#top'

  resources :books, only: [:index,:show,:edit,:create,:destroy,:update] do
    resource :favorites,only: [:create,:destroy]
    resources :book_comments, only: [:create,:destroy]
  end

  resources :users, only: [:index,:show,:edit,:update] do
   resources :relationship,only: [:create, :destroy]
   get "relationships/following"
   get "relationships/follower"

  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end