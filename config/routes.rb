Rails.application.routes.draw do
  get 'book_comments/create'
  get 'book_comments/destroy'
devise_for :users  #
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root :to =>"homes#top"
  get "home/about"=>"homes#about"

  resources :books, only: [:index,:show,:edit,:create,:destroy,:update] do
    resource :favorites, only: [:create, :destroy]
  resources :book_comments, only: [:create]
  end

  resources :users, only: [:index,:show,:edit,:update] do
    resources :relationships, only: [:create,:destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
