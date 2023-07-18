Rails.application.routes.draw do
  get 'pages/home'
  get 'pages/restricted'
  devise_for :users

  resources :motorcycles, only: [:index, :show, :create, :destroy] do 
    resources :reservations, only: [:index, :create, :destroy]
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
