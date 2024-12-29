class StockMovement < ApplicationRecord
  belongs_to :source, polymorphic: true
  belongs_to :destination, polymorphic: true
  belongs_to :inventory
end

