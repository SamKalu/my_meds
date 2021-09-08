Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#landing_page'
  get "/dashboard", to: "pages#dashboard"
  resources :meds
  resources :treatments, only: [:index, :new, :create, :show, :destroy, :edit, :update]
end
