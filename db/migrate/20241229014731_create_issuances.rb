class CreateIssuances < ActiveRecord::Migration[8.0]
  def change
    create_table :issuances do |t|
      t.references :inventory, null: false, foreign_key: true
      t.references :warehouse, null: false, foreign_key: true
      t.references :branch, null: false, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
