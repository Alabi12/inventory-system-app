Rails.application.routes.draw do
  resources :warehouses
  resources :branches
  resources :inventories
  resources :stock_movements
  root "inventories#index"
end
