Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items
  resources :users, only: [:show]
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
