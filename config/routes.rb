Gameq::Application.routes.draw do
  resources :sessions, only: [:create, :destroy]
  resources :consoles, only: [:create, :show, :update, :destroy, :index]
  resources :tags, only: [:create, :show, :index, :update, :destroy]
  resources :users do
    resources :games, only: [:create, :destroy, :update, :show, :index], controller: :user_games 
  end
  resources :games, only: [:show, :index]
end
