Rails.application.routes.draw do
  resources :warehouses do
    member do
      get :vehicle_usage
      get :slow_movement_report, to: 'warehouses#slow_movement_report', as: :slow_movement_report
      get 'dashboard', to: 'warehouses#dashboard', as: 'dashboard'
    end
  end

  resources :vehicles, only: [:index, :new, :create] do
    collection do
      get :usage, to: 'vehicles#usage', as: :vehicle_usage
    end
  end

  resources :warehouses do
    resources :vehicles, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  end
  

  resources :inventories
  resources :issuances
  resources :vehicles
  resources :branches
  resources :stock_movements

  root 'warehouses#index'
end