class Issuance < ApplicationRecord
  belongs_to :inventory
  belongs_to :warehouse
  belongs_to :branch

  validates :quantity, presence: true, numericality: { greater_than: 0 }
end
