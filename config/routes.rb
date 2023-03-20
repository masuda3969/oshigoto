Rails.application.routes.draw do



  namespace :public do
    get 'schedules/new'
    get 'schedules/index'
    get 'schedules/show'
    get 'schedules/edit'
  end
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
    get 'articles/confirm'
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

  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
