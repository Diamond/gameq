Gameq::Application.routes.draw do
  resources :sessions, only: [:create, :destroy]
  resources :users, only: [:create, :show, :update, :destroy] do
    resources :games, only: [:index]
  end
  resources :games, only: [:create, :show, :update, :destroy, :index]
  resources :consoles, only: [:create, :show, :update, :destroy, :index]
  resources :tags, only: [:create, :show, :index, :update, :destroy] do
    resources :games, only: [:index]
  end
end
