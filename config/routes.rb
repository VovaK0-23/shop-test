Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  mount API, at: '/'
  mount GrapeSwaggerRails::Engine, at: '/documentation'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  get    'shops',             to: 'shop#index',         as: :shops
  get    'categories/:id',    to: 'category#index',     as: :categories
  get    'products/:id',      to: 'product#index',      as: :products
  get    'product/:id',       to: 'product#show',       as: :product
  post   'cart_item/:id',     to: 'cart_item#create',   as: :create_cart_item
  delete 'cart_item/:id',     to: 'cart_item#destroy',  as: :delete_cart_item
  get    'cart',              to: 'cart#show',          as: :cart
  get    'order',             to: 'order#new',          as: :new_order
  post   'order',             to: 'order#create',       as: :create_order
  get    'confirm/:id',       to: 'order#confirm',      as: :confirm
  post   'payment/:id',       to: 'payment#new',        as: :new_payment
  get    'thanks/:id',        to: 'order#thanks',       as: :thanks
  get    'payment_error/:id', to: 'order#error',        as: :payment_error
end
