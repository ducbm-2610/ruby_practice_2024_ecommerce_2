Rails.application.routes.draw do
  resources :products

  devise_for :users

  namespace :admin do
    resources :dashboard
  end
  
  root "products#index"
end
