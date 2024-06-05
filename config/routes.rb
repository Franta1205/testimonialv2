Rails.application.routes.draw do
  devise_for :users
  root 'workspaces#index'

  resources :workspaces, only: [:create, :destroy, :show] do
    resources :forms do
      member do
        get :new_testimonial
        post :create_testimonial
        get :testimonial_success_page
      end
    end
    resources :testimonials, only: [:new, :create, :destroy] do
      member do
        post :toggle_favorite
      end
      collection do
        get :wall_of_love
      end
    end
  end
end
