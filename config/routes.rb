Rails.application.routes.draw do

  namespace :admin do
    get 'users/index'
    get 'users/show'
    get 'users/edit'
    get 'users/update'
  end
  devise_for :users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }


  # 会員側
  scope module: :public do
    root to: "homes#top"
    get 'homes/about'
    get 'homes/help'
    resources :users, only: [:index, :show, :edit, :update] do
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
    end
    resources :recruitings do
      resource :favorites, only: [:create, :destroy]
    end
    resources :areas, only: [:index, :show, :edit, :update]
  end
  
  
  # 管理側
  namespace :admin do
    resources :users, only: [:index, :show, :edit, :update]
    resources :prefectures, only: [:index, :create, :edit, :update, :destroy]
    resources :recruitings, only: [:index, :show, :edit, :update, :destroy]
  end
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
