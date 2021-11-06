Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'users#index'
  post 'users/:id/like/create', to: 'likes#create', as: 'post_like_create'
  post 'users/:id/comment/create', to: 'comments#create', as: 'post_comment_create'
  get 'users/:user_id/post/new', to: 'posts#new', as: 'user_post_new'
  post 'users/:user_id/post', to: 'posts#create', as: 'user_post_create'
  get 'users/:user_id/posts', to: 'posts#index', as: 'user_posts'
  get 'users/:user_id/posts/:id', to: 'posts#show', as: 'user_post'
  get 'users', to: 'users#index', as: 'users'
  get 'users/:id', to: 'users#show', as: 'user'
end
