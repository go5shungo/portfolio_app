Rails.application.routes.draw do

  get 'homes/top'
  get 'homes/about', as: 'about'

  devise_for :users
  scope module: :public do
    resources :posts do
      resources :comments,only: [:create,:destroy]
    end
    resources :favorite,only: [:create,:destroy]
    resources :relationships,only: [:create,:destroy]
    get  "relationships/followings"  => "relatinships#followings"
    get  "relationships/followers"  => "relatinships#followers"
    resources :maps
    resources :questions
    resources :answers,except: [:index]
    resources :pets,except: [:show,:index]
  end
  namespace :admin do
    resources :sessions,only: [:new,:create,:destroy]
    resources :users,only: [:show,:destroy,:index]
    resources :maps,only: [:show,:destroy,:index]
    resources :posts,only: [:show,:destroy,:index]
    resources :questions,only: [:show,:destroy,:index]
    resources :answers,only: [:show,:destroy,:index]
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
