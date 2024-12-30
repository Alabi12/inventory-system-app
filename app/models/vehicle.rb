class Vehicle < ApplicationRecord
  belongs_to :warehouse

  validates :vehicle_number, presence: true
  validates :capacity, presence: true, numericality: { only_integer: true }
end
