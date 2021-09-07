Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#landing_page'
  get "/dashboard", to: "pages#dashboard"
  resources :meds, only: %i[ new create index show edit update]
end
