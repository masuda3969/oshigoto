Rails.application.routes.draw do

  #管理者側
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
     sessions: "admin/sessions"
  }

  namespace :admin do
    get 'homes/top'
    get 'homes/about'
  end


  #会員側
  scope module: :public do

    root to: 'homes#top'
    get 'about' => 'homes#about', as: "about"
    

    # 記事投稿
    resources :articles do
      resource :likes, only: [:create, :destroy] 
        
      resources :comments, only: [:create, :destroy, :index]
    collection do
      get 'search'
    end
    end
    resources :likes, only: [:index]
    
    resources :schedules
    
    devise_for :users,skip: [:passwords], controllers: {
      sessions: 'public/sessions',
      registrations: 'public/registrations',
    }

    resources :users, only: [:index, :show] do
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
    end

    
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
