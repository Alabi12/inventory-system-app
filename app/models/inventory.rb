class Inventory < ApplicationRecord
  belongs_to :branch, optional: true
  belongs_to :warehouse

  validates :quantity, numericality: { greater_than_or_equal_to: 0 }
end

