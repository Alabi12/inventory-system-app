class CreateStockMovements < ActiveRecord::Migration[8.0]
  def change
    create_table :stock_movements do |t|
      t.references :source, polymorphic: true, null: false
      t.references :destination, polymorphic: true, null: false
      t.references :inventory, null: false, foreign_key: true
      t.integer :quantity
      t.string :status

      t.timestamps
    end
  end
end
