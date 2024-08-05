Rails.application.routes.draw do
  resources :products

  devise_for :users

  namespace :admin do
    resources :dashboard
    resources :orders do
      member do
        post :confirm
        delete :cancel
      end
    end
  end

  post 'cart/add/:id', to: 'carts#add', as: 'cart_add'
  delete 'cart/remove/:id', to: 'carts#remove', as: 'cart_remove'
  get 'cart/checkout', to: 'carts#checkout', as: 'cart_checkout'
  
  resources :orders
  delete 'orders/cancel/:id', to: 'orders#cancel', as: 'cancel_order'
  
  root "products#index"
end
