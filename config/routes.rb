Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#landing_page'
  # get "/dashboard", to: "pages#dashboard"
  resources :meds

  resource :dashboard, only: [:show] do 
    collection do
      get :treatments
      get :inventory
      get :docs
      get :profile
    end
  end
end
