Gameq::Application.routes.draw do
  get "game/create"
  get "game/show"
  get "game/index"
  get "game/destroy"
  get "game/update"
  resources :sessions, only: [:create, :destroy]
  resources :users, only: [:create, :show, :update, :destroy]
end
