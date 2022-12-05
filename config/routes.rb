Rails.application.routes.draw do

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
    resources :users, only: [:index, :show, :edit, :update]
    resources :recruitings
    resources :areas, only: [:index, :show, :edit, :update]
  end
  
  
  # 管理側
  namespace :admin do
    resources :users, only: [:index, :show, :edit, :update]
    resources :prefectures, only: [:index, :create, :edit, :update]
    resources :recruitings, only: [:index, :show, :edit, :update, :delete]
  end
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
