Rails.application.routes.draw do
  get 'motorcycles/index'
  get 'motorcycles/show'
  get 'motorcycles/create'
  get 'motorcycles/delete'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
