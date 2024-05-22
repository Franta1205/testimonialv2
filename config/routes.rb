Rails.application.routes.draw do
  devise_for :users
  root 'workspaces#index'

  resources :workspaces, only: [:create, :destroy, :show] do
    resources :forms, only: [:new]
    resources :testimonials, only: [:new, :create, :destroy] do
      member do
        post :toggle_favorite
      end
    end
  end
end
