Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#landing_page'
  resources :pages, only: [:landing_page] do
    collection do
      get :dashboard
    end
  end
  resources :meds, only: [ :new, :create, :index, :show ]
end
