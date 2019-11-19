Rails.application.routes.draw do
  devise_for :users,
  controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  root to: 'items#index'
  resources :items do
    member do
      get  'buycheck'
      get  'details'
      post 'purchase'
    end
    collection do
      get   'search'
    end
  end
  resources :users do
    collection do
      get 'logout'
      get 'card_edit'
      get 'mypage_edit'
      get 'identification'
    end
    member do
      get 'exhibition'
      get 'selled'
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
