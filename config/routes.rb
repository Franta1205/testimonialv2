Rails.application.routes.draw do
  devise_for :users
  root 'workspaces#index'

  resources :workspaces, only: [:create, :destroy, :show]
end
