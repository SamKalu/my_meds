Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get "/dashboard", to: "pages#dashboard"
  resources :meds
  resources :treatments do
    resources :schedules, only: %i[new create]
  end
  resources :schedules, only: %i[edit update destroy]
end
