Gameq::Application.routes.draw do
  resources :sessions, only: [:create, :destroy]
  resources :consoles, only: [:create, :show, :update, :destroy, :index]
  resources :users do
    resources :games, only: [:create, :destroy, :update, :show, :index], controller: :user_games 
  end
  resources :games, only: [:show, :index] do
    resources :tags, only: [:create], controller: :game_tags
  end
  resources :tags, only: [:show] do
    resources :games, only: [:index]
  end
end
