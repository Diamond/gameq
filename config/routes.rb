Gameq::Application.routes.draw do
  resources :sessions, only: [:create, :destroy]
  resources :users, only: [:create, :show, :update, :destroy]
  resources :games, only: [:create, :show, :update, :destroy, :index]
end
