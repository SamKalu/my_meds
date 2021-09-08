Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get "/dashboard", to: "pages#dashboard"
  resources :meds
  resources :treatments do
    resources :schedules
  end
end
