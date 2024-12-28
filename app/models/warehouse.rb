class Warehouse < ApplicationRecord
  has_many :inventories
  has_many :stock_movements, as: :source
end
