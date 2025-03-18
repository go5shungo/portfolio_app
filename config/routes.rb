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
  resources :users, only: [:show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
  	get "followings" => "relationships#followings", as: "followings"
  	get "followers" => "relationships#followers", as: "followers"
    get "favorites" => "users#favorites", as: "favorites"
  end
  scope module: :public do
    resources :posts do
      resources :post_comments,only: [:create,:destroy]
      resource :favorite,only: [:create,:destroy]
    end
    resources :maps
    resources :questions
    resources :answers,except: [:index]
    resources :pets,except: [:index]
    resources :users,only: [] do 
      resources :pets,only: [:index]
    end
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
