Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :meds

  resources :treatments do
    resources :schedules, only: %i[new create]
  end
  
  resource :dashboard, only: [:show] do 
    collection do
      get :treatments
      get :inventory
      get :docs
      get :profile
    end
  end
  
  resources :schedules, only: %i[edit update destroy]
end
