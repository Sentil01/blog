Rails.application.routes.draw do
  # devise_for :users
  # resources :posts_users_read_statuses
  post '/topics/:topic_id/posts/:post_id/posts_users_read_statuses',to: 'posts_users_read_statuses#create'
  post '/posts/:post_id/posts_users_read_statuses',to: 'posts_users_read_statuses#create'
  devise_for :users
  devise_scope :user do

    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :user_comment_rating
  resources :comments do
    resources :user_comment_rating
  end
  resources :posts do
    resources :ratings

  end

  resources :tags

  resources :topics do
    resources :posts
  end
  resources :posts
  resources  :posts do
    resources :comments
  end
  # resources :topics
  #get 'home/index'
  root 'home#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
