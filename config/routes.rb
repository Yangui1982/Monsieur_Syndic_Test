Rails.application.routes.draw do
  devise_for :users
  root to: "comments#index"
  resources :comments, except: [:edit, :update]
  get "prix", to: "pages#prices"
  get "about", to: "pages#about"
end
