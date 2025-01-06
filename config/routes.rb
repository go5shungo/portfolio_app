Rails.application.routes.draw do
  devise_for :users
  delete 'post_comments/destroy'
  post 'post_comments/create'
  get 'posts/edit'
  get 'posts/show'
  get 'posts/update'
  get 'posts/destroy'
  get 'posts/new'
  get 'posts/index'
  get 'posts/create'
  get 'users/edit'
  get 'users/show'
  get 'users/update'
  get 'users/destroy'
  get 'homes/top'
  get 'homes/about', as: 'about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
