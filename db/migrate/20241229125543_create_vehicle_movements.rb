class CreateVehicleMovements < ActiveRecord::Migration[8.0]
  def change
    create_table :vehicle_movements do |t|
      t.references :vehicle, null: false, foreign_key: true
      t.references :warehouse, null: false, foreign_key: true
      t.string :driver
      t.string :destination
      t.date :date

      t.timestamps
    end
  end
end
