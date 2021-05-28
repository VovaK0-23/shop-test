Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"
  get 'shops', to: 'shop#index', as: :shops
  get 'categories/:id', to: 'category#index', as: :categories
  get 'products/:id', to: 'product#index', as: :products
end
