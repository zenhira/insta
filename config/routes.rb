Rails.application.routes.draw do
  root to: "feeds#index"
  resources :feeds do
    collection do
      post :confirm
    end
  end
  resources :users, only: [:new, :create, :index, :show, :destroy]
  resources :sessions, only: [:new, :create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  resources :users, only: [:new, :create, :index, :show, :edit, :update] do
    member do
      get :followings
      get :followers
      get :likes
    end
  end
  resources :favorites, only: [:create, :destroy]
end
