class Inventory < ApplicationRecord
  belongs_to :warehouse, optional: true
  belongs_to :branch, optional: true
end

