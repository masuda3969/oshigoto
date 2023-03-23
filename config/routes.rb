Rails.application.routes.draw do


  #管理者側
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
     sessions: "admin/sessions"
  }

  namespace :admin do
    get 'homes/top'
    get 'homes/about'
    resources :users, only: [:index, :show, :edit, :update]
    resources :articles, only: [:index, :show, :destroy]
  end



  #会員側
  scope module: :public do

    root to: 'homes#top'
    get 'about' => 'homes#about', as: "about"

    get 'search' => "searches#search"

    # 記事投稿
    resources :articles do
      #お気に入り登録／削除
      resource :likes, only: [:create, :destroy]
      #記事のコメント機能
      resources :comments, only: [:create, :destroy, :index]
    #記事検索機能のルーティング
    collection do
      get 'search'
    end
    end

    #お気に入り一覧画面のルーティング
    resources :likes, only: [:index]
    #スケジュール機能
    resources :schedules
    #deviseを用いたユーザーのログイン／ログアウト
    devise_for :users,skip: [:passwords], controllers: {
      sessions: 'public/sessions',
      registrations: 'public/registrations',
    }
    # 退会確認画面
      get '/users/unsubscribe' => 'users#unsubscribe', as: 'unsubscribe'
      # 論理削除用のルーティング
      patch '/users/:id/withdrawal' => 'users#withdrawal', as: 'withdrawal'
      #ユーザー一覧／ユーザー詳細画面
      resources :users, only: [:index, :show] do

      #フォロー機能のルーティング
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
    end


  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
