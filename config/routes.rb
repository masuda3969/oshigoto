Rails.application.routes.draw do
  
  #管理者側
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
     sessions: "admin/sessions"
  }
  
  namespace :admin do
  end
  
  #会員側
  devise_for :users,skip: [:passwords], controllers: {
      sessions: 'public/sessions',
      registrations: 'public/registrations',
  }
  
  scope module: :public do
  end
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
