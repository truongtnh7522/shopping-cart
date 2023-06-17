Rails.application.routes.draw do
  root 'products#index'

  post '/add_to_cart', to: 'carts#add_to_cart', as: 'add_to_cart'
  post '/increase_quantity', to: 'carts#increase_quantity', as: 'increase_quantity'
  post '/decrease_quantity', to: 'carts#decrease_quantity', as: 'decrease_quantity'
  post '/remove_from_cart', to: 'carts#remove_from_cart', as: 'remove_from_cart'
end
