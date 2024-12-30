class CreateVehicles < ActiveRecord::Migration[8.0]
  def change
    create_table :vehicles do |t|
      t.string :vehicle_number
      t.integer :capacity
      t.references :warehouse, null: false, foreign_key: true

      t.timestamps
    end
  end
end
