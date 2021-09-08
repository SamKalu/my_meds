Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :meds
  resources :treatments do
    resources :schedules
  end

  resource :dashboard, only: [:show] do 
    collection do
      get :treatments
      get :inventory
      get :docs
      get :profile
    end
  end
end
