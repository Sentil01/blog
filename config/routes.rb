Rails.application.routes.draw do
  resources :topics do
    resources :posts
  end
  resources :posts
  # resources :topics
  #get 'home/index'
  root 'home#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
