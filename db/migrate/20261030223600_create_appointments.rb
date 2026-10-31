class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.references :user, null: false, foreign_key: true
      t.references :service_listing, null: false, foreign_key: true
      t.datetime :scheduled_at
      t.string :status, default: "requested", null: false
      t.string :address
      t.text :notes

      t.timestamps
    end

    add_index :appointments, :status
  end
end
