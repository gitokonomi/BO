Rails.application.routes.draw do

  devise_for :users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }


  #ゲストログイン用
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  # 会員側
  scope module: :public do
    root to: "homes#top"
    resources :users, only: [:index, :show, :edit, :update] do
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
      member do
       get 'favorites'
      end
    end
    resources :recruitings do
      resource :favorites, only: [:create, :destroy]
      resources :recruiting_comments, only: [:create, :destroy]
    end
    resources :areas, only: [:create, :destroy]
    resources :notifications, only: [:index]
  end


  # 管理側
  namespace :admin do
    resources :users, only: [:index, :show, :edit, :update] do
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
    end
    resources :prefectures, only: [:index, :create, :edit, :update, :destroy]
    resources :recruitings, only: [:index, :show, :edit, :update, :destroy] do
      resources :recruiting_comments, only: [:destroy]
    end
    resources :areas, only: [:create, :destroy]
  end

  get '/about' => 'public/homes#about', as: :about
  # get '/help' => 'public/homes#help', as: :help
  get '/search', to: 'searches#search'
  get '/search_prefecture', to: 'searches#search_prefecture'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
