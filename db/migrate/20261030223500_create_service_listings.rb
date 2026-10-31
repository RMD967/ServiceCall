class CreateServiceListings < ActiveRecord::Migration[7.0]
  def change
    create_table :service_listings do |t|
      t.references :professional, null: false, foreign_key: true
      t.references :service_category, null: false, foreign_key: true
      t.string :title, null: false
      t.text :description
      t.decimal :price, precision: 10, scale: 2
      t.string :price_unit, default: "fixed", null: false
      t.boolean :active, default: true, null: false

      t.timestamps
    end
  end
end
