class AddDateToStockMovements < ActiveRecord::Migration[8.0]
  def change
    add_column :stock_movements, :date, :datetime
  end
end
