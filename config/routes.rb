Gameq::Application.routes.draw do
  resources :sessions, only: [:create, :destroy]
  resources :users, only: [:create, :show]
end
