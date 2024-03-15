Rails.application.routes.draw do
  devise_for :users
  root to: "comments#index"
  resources :comments, except: [:edit, :update]
  get "prix", to: "pages#prices"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
