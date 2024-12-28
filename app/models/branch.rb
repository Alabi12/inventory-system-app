class Branch < ApplicationRecord
  has_many :inventories
  has_many :stock_movements, as: :destination
end
