Rails.application.routes.draw do
  
  devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'
  }

  namespace :admin do
    get 'dashboards', to: 'dashboards#index'
    resources :users, only: [:destroy] 
  end

  root to: 'homes#top'
  get 'homes/about', as: 'about'


  
  devise_for :users
  resources :users, only: [:show, :edit, :update]
  scope module: :public do
    resources :posts do
      resources :post_comments,only: [:create,:destroy]
      resource :favorite,only: [:create,:destroy]
    end
    
    resources :relationships,only: [:create,:destroy]
    get  "relationships/followings"  => "relationships#followings"
    get  "relationships/followers"  => "relationships#followers"
    resources :maps
    resources :questions
    resources :answers,except: [:index]
    resources :pets
    get '/search', to: 'searches#search'
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
