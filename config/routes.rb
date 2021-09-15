Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to: 'pages#home'
  resources :meds
  resources :documents

  resources :treatments do
    resources :schedules, only: %i[new create]
  end

  resource :dashboard, only: [:show] do
    collection do
      get :profile
    end
  end

  resources :schedules, only: %i[edit update destroy]

  resources :users, only: [] do
    post :impersonate, on: :member
    post :stop_impersonating, on: :collection
  end

  resources :intakes, only: %i[index] do
    member do
      post :take
    end
  end
end
