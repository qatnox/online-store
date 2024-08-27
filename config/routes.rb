# config/routes.rb
Rails.application.routes.draw do

  # Root path of the application
  root 'goods#index'

  # ActiveAdmin routes
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # Resources for Goods, Categories, Users, Carts, Orders
  resources :goods, only: [:index, :show]
  resources :categories, only: [:index, :show]
  resources :users, only: [:index, :show]
  resources :carts, only: [:show] do
    resources :cart_items, only: [:create, :update, :destroy]
  end
  resources :orders, only: [:index, :show, :create] do
    resources :order_items, only: [:create, :update, :destroy]
  end

  # Resources for Messages and Chats
  resources :messages, only: [:index, :show, :create]
  resources :chats, only: [:show] do
    resources :messages, only: [:create]
  end

  # WebSocket channel for chat
  mount ActionCable.server => '/cable'
end
