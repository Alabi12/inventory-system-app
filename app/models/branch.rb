class Branch < ApplicationRecord
  has_many :inventories, dependent: :destroy
  has_many :stock_movements, as: :destination
end
