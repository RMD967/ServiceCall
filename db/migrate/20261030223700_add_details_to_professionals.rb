class AddDetailsToProfessionals < ActiveRecord::Migration[7.0]
  def change
    add_column :professionals, :city, :string
    add_column :professionals, :service_area, :string
    add_column :professionals, :years_experience, :integer
    add_column :professionals, :verified, :boolean, default: false, null: false
  end
end
