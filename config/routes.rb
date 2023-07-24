Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  get 'pages/home'
  get 'pages/restricted'
  devise_for :users

  resources :motorcycles, only: [:index, :show, :create, :destroy]
  resources :reservations, only: [:index, :create, :destroy]
  

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
