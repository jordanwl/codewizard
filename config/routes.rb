Rails.application.routes.draw do
  devise_for :users
  authenticated :user do
    root 'gamecontrols#town'
  end
  root to: 'pages#home'
  get 'ui_kit', to: 'pages#ui_kit'
  get '/town', to: "gamecontrols#town"
  get '/wild', to: "gamecontrols#wild"
  get '/result', to: "gamecontrols#result"
  get '/close_profile', to: "gamecontrols#close_profile"
  resources :characters, only: [:index, :show, :new, :create] do
    member do
      post 'add_item', to: "characters#add_item"
    end
  end
  resources :questions, only: [:show]
  resources :levels, only: [:index, :show]
  resources :battle_logs, only: [:create, :update]
  resources :items, only: [:index, :create, :new]
end
