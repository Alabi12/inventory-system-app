class Warehouse < ApplicationRecord
  has_many :inventories, dependent: :destroy
  has_many :stock_movements, as: :source
  has_many :vehicle_movements
  has_many :vehicles, dependent: :destroy
  
  validates :name, :location, presence: true
end
