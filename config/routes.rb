Rails.application.routes.draw do
  devise_for :users,
  controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  root to: 'items#index'
  resources :items do
    # collection do #collrectionでの書き方、仮消し
    #   get 'buycheck/:id'=> 'items#buycheck', as: 'buycheck'
    #   post 'purchase:id'=> 'items#purchase', as: 'purchase'
    # end
    member do
      get 'buycheck'
      post 'purchase'
    end
  end
  resources :users do
    collection do
      get 'logout'
      get 'card_edit'
      get 'mypage_edit'
      get 'identification'
    end
  end
  resources :signup do
    collection do
      get 'new1st'
      get 'new2nd'
      get 'new3rd'
      get 'new4th'
      get 'done'
    end
  end
end
